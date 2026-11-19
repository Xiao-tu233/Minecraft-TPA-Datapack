"""Tests for the standard-library RCON client used by deploy.py."""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import deploy


def packet(request_id: int, packet_type: int, payload: str = "") -> bytes:
    body = (
        struct.pack("<ii", request_id, packet_type)
        + payload.encode("utf-8")
        + b"\0\0"
    )
    return struct.pack("<i", len(body)) + body


class FakeSocket:
    def __init__(self, responses: list[bytes]):
        self.responses = bytearray(b"".join(responses))
        self.sent = []

    def __enter__(self):
        return self

    def __exit__(self, *_args):
        return False

    def settimeout(self, _timeout):
        pass

    def sendall(self, data):
        self.sent.append(data)

    def recv(self, size):
        result = self.responses[:size]
        del self.responses[:size]
        return bytes(result)


class DeployRconTests(unittest.TestCase):
    def test_packet_encodes_little_endian_fields(self):
        encoded = deploy.encode_rcon_packet(4, 2, "reload")
        self.assertEqual(struct.unpack("<i", encoded[:4])[0], len(encoded) - 4)
        self.assertEqual(struct.unpack("<ii", encoded[4:12]), (4, 2))
        self.assertEqual(encoded[12:], b"reload\0\0")

    def test_send_command_authenticates_then_sends_command(self):
        fake = FakeSocket([packet(1, 2), packet(2, 0, "Reloading! ")])
        with patch.object(deploy.socket, "create_connection", return_value=fake):
            response = deploy.send_rcon_command("127.0.0.1", 25575, "secret", "reload")
        self.assertEqual(response, "Reloading! ")
        self.assertEqual(fake.sent, [
            deploy.encode_rcon_packet(1, 3, "secret"),
            deploy.encode_rcon_packet(2, 2, "reload"),
        ])

    def test_bad_password_is_reported(self):
        fake = FakeSocket([packet(-1, 2)])
        with patch.object(deploy.socket, "create_connection", return_value=fake):
            with self.assertRaises(PermissionError):
                deploy.send_rcon_command("127.0.0.1", 25575, "wrong", "reload")
        self.assertEqual(len(fake.sent), 1)

    def test_configure_preserves_comments_and_sets_generated_rcon_values(self):
        with tempfile.TemporaryDirectory() as temporary:
            server_dir = Path(temporary) / "26.2"
            server_dir.mkdir()
            properties = server_dir / "server.properties"
            properties.write_text(
                "# Keep this comment\nserver-port=25565\nenable-rcon=false\nrcon.port=25575\nrcon.password=\n",
                encoding="utf-8",
            )
            with (
                patch.object(deploy, "SERVER_DIR", Path(temporary)),
                patch.object(deploy, "find_unused_rcon_port", return_value=25600),
                patch.object(deploy.secrets, "token_urlsafe", return_value="generated-secret"),
            ):
                configured = deploy.configure_rcon([server_dir])
            values = deploy.read_server_properties(server_dir)
            self.assertEqual(configured, [server_dir])
            self.assertTrue(properties.read_text(encoding="utf-8").startswith("# Keep this comment\n"))
            self.assertEqual(values["enable-rcon"], "true")
            self.assertEqual(values["rcon.port"], "25600")
            self.assertEqual(values["rcon.password"], "generated-secret")

    def test_confirmation_then_enable_configures_but_does_not_reload_disabled_rcon(self):
        with tempfile.TemporaryDirectory() as temporary:
            server_dir = Path(temporary) / "26.2"
            server_dir.mkdir()
            (server_dir / "server.properties").write_text(
                "server-port=25565\nenable-rcon=false\nrcon.port=25575\nrcon.password=\n",
                encoding="utf-8",
            )
            with (
                patch.object(deploy, "SERVER_DIR", Path(temporary)),
                patch.object(deploy, "is_port_open", return_value=True),
                patch.object(deploy, "find_unused_rcon_port", return_value=25600),
                patch.object(deploy.secrets, "token_urlsafe", return_value="generated-secret"),
                patch.object(deploy, "send_rcon_command") as send_command,
                patch("builtins.input", side_effect=["y", "y"]),
            ):
                deploy.reload_deployed_servers([server_dir])
            send_command.assert_not_called()
            self.assertEqual(
                deploy.read_server_properties(server_dir)["enable-rcon"],
                "true",
            )

    def test_confirmation_reprompts_until_y_or_n(self):
        with patch("builtins.input", side_effect=["", "maybe", "Y"]):
            self.assertTrue(deploy.confirm_reload())
        with patch("builtins.input", side_effect=["invalid", "n"]):
            self.assertFalse(deploy.confirm_reload())


if __name__ == "__main__":
    unittest.main()
