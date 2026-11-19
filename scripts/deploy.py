"""Build and deploy the appropriate generated datapack to local test servers."""

from __future__ import annotations

import argparse
import json
import re
import secrets
import shutil
import socket
import struct
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Tuple


ROOT = Path(__file__).resolve().parent.parent
SERVER_DIR = ROOT / "servers"
BUILD_DIR = ROOT / "build"
BUILD_SCRIPT = Path(__file__).with_name("build.py")
GENERATED_PREFIX = "TPA_Datapack-"
RCON_PACKET_LIMIT = 4_096_000
LOCAL_HOST = "127.0.0.1"


def version_key(value: str) -> Tuple[int, int, int, int]:
    match = re.fullmatch(r"(\d+(?:\.\d+){1,3})", value.strip())
    if not match:
        raise ValueError(f"Invalid Minecraft version: {value!r}")
    numbers = tuple(int(part) for part in match.group(1).split("."))
    return (numbers + (0, 0, 0, 0))[:4]  # type: ignore[return-value]


def in_range(
    server_version: Tuple[int, int, int, int],
    minimum: str,
    maximum: str,
) -> bool:
    return version_key(minimum) <= server_version <= version_key(maximum)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Deploy Minecraft-TPA-Datapack to local test servers"
    )
    parser.add_argument(
        "--server",
        action="append",
        help="Deploy only this servers/<version> directory; may be passed more than once",
    )
    parser.add_argument(
        "--no-build",
        action="store_true",
        help="Use existing build/manifest.json instead of running build.py",
    )
    return parser.parse_args()


def run_build() -> None:
    print("Running build.py before deployment...")
    subprocess.run([sys.executable, str(BUILD_SCRIPT)], cwd=ROOT, check=True)


def load_manifest() -> List[Dict[str, str]]:
    manifest_path = BUILD_DIR / "manifest.json"
    if not manifest_path.is_file():
        raise FileNotFoundError(f"Build manifest does not exist: {manifest_path}")
    with manifest_path.open(encoding="utf-8") as stream:
        manifest = json.load(stream)
    artifacts = manifest.get("artifacts")
    if not isinstance(artifacts, list):
        raise ValueError(f"Invalid build manifest: {manifest_path}")
    return artifacts


def choose_artifact(
    server_version: Tuple[int, int, int, int],
    artifacts: List[Dict[str, str]],
) -> Dict[str, str]:
    matches = [
        artifact
        for artifact in artifacts
        if in_range(server_version, artifact["min_version"], artifact["max_version"])
    ]
    if not matches:
        raise ValueError(f"No built datapack supports server version {server_version}")
    return max(matches, key=lambda artifact: version_key(artifact["min_version"]))


def remove_previous_generated_packs(datapacks: Path) -> None:
    if not datapacks.exists():
        return
    for child in datapacks.iterdir():
        if not child.name.startswith(GENERATED_PREFIX):
            continue
        if child.is_dir():
            shutil.rmtree(child)
        else:
            child.unlink()


def deploy_server(server_dir: Path, artifact: Dict[str, str]) -> None:
    datapacks = server_dir / "world" / "datapacks"
    source = ROOT / artifact["path"]
    if not source.is_dir():
        raise FileNotFoundError(f"Built artifact does not exist: {source}")
    datapacks.mkdir(parents=True, exist_ok=True)
    remove_previous_generated_packs(datapacks)
    destination = datapacks / artifact["name"]
    shutil.copytree(source, destination)
    print(f"  {server_dir.name}: {artifact['name']}")


def read_server_properties(server_dir: Path) -> Dict[str, str]:
    properties_path = server_dir / "server.properties"
    if not properties_path.is_file():
        return {}

    properties = {}
    for line in properties_path.read_text(encoding="utf-8-sig").splitlines():
        line = line.strip()
        if not line or line.startswith(("#", "!")) or "=" not in line:
            continue
        key, value = line.split("=", 1)
        properties[key.strip()] = value.strip()
    return properties


def write_server_properties(server_dir: Path, updates: Dict[str, str]) -> None:
    properties_path = server_dir / "server.properties"
    if not properties_path.is_file():
        raise FileNotFoundError(f"Server properties do not exist: {properties_path}")

    content = properties_path.read_text(encoding="utf-8-sig")
    newline = "\r\n" if "\r\n" in content else "\n"
    lines = content.splitlines()
    remaining = dict(updates)
    output = []
    for line in lines:
        stripped = line.strip()
        if stripped and not stripped.startswith(("#", "!")) and "=" in line:
            key = line.split("=", 1)[0].strip()
            if key in updates:
                output.append(f"{key}={updates[key]}")
                remaining.pop(key, None)
                continue
        output.append(line)
    output.extend(f"{key}={value}" for key, value in remaining.items())
    properties_path.write_text(newline.join(output) + newline, encoding="utf-8")


def is_port_open(host: str, port: int) -> bool:
    try:
        with socket.create_connection((host, port), timeout=0.25):
            return True
    except OSError:
        return False


def encode_rcon_packet(request_id: int, packet_type: int, payload: str) -> bytes:
    body = struct.pack("<ii", request_id, packet_type) + payload.encode("utf-8") + b"\0\0"
    return struct.pack("<i", len(body)) + body


def receive_exact(sock: socket.socket, size: int) -> bytes:
    chunks = bytearray()
    while len(chunks) < size:
        chunk = sock.recv(size - len(chunks))
        if not chunk:
            raise ConnectionError("RCON server closed the connection")
        chunks.extend(chunk)
    return bytes(chunks)


def receive_rcon_packet(sock: socket.socket) -> Tuple[int, int, str]:
    size = struct.unpack("<i", receive_exact(sock, 4))[0]
    if size < 10 or size > RCON_PACKET_LIMIT:
        raise ConnectionError(f"Invalid RCON packet size: {size}")
    packet = receive_exact(sock, size)
    request_id, packet_type = struct.unpack("<ii", packet[:8])
    payload = packet[8:-2].decode("utf-8", errors="replace")
    if packet[-2:] != b"\0\0":
        raise ConnectionError("Malformed RCON packet")
    return request_id, packet_type, payload


def send_rcon_command(host: str, port: int, password: str, command: str) -> str:
    with socket.create_connection((host, port), timeout=2) as rcon:
        rcon.settimeout(2)
        rcon.sendall(encode_rcon_packet(1, 3, password))
        request_id, response_type, _ = receive_rcon_packet(rcon)
        if request_id == -1:
            raise PermissionError("RCON authentication failed")
        if request_id != 1 or response_type != 2:
            raise ConnectionError("Unexpected RCON authentication response")

        rcon.sendall(encode_rcon_packet(2, 2, command))
        response_id, response_type, response = receive_rcon_packet(rcon)
        if response_id != 2 or response_type != 0:
            raise ConnectionError("Unexpected RCON command response")
        return response


def confirm_yes_no(prompt: str, eof_message: str) -> bool:
    try:
        while True:
            answer = input(prompt).strip().lower()
            if answer == "y":
                return True
            if answer == "n":
                return False
            print("Please enter Y or n.")
    except EOFError:
        print(eof_message)
        return False


def confirm_reload() -> bool:
    return confirm_yes_no(
        "Detected test server(s) are running. Reload now? (Y/n) ",
        "No interactive input available; skipping RCON reload.",
    )


def confirm_enable_rcon() -> bool:
    return confirm_yes_no(
        "RCON is disabled. Configure it with an unused port and generated password? (Y/n) ",
        "No interactive input available; leaving RCON configuration unchanged.",
    )


def find_unused_rcon_port(reserved_ports: set[int]) -> int:
    for port in range(25575, 65536):
        if port in reserved_ports:
            continue
        probe = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            probe.bind(("", port))
        except OSError:
            continue
        finally:
            probe.close()
        return port
    raise OSError("No unused TCP port is available for RCON")


def configure_rcon(server_dirs: List[Path]) -> List[Path]:
    reserved_ports = set()
    for server_dir in SERVER_DIR.iterdir():
        if not server_dir.is_dir():
            continue
        properties = read_server_properties(server_dir)
        for key in ("server-port", "rcon.port"):
            try:
                reserved_ports.add(int(properties[key]))
            except (KeyError, ValueError):
                continue

    configured = []
    for server_dir in server_dirs:
        properties_path = server_dir / "server.properties"
        if not properties_path.is_file():
            print(f"  {server_dir.name}: server.properties missing; cannot enable RCON")
            continue
        try:
            rcon_port = find_unused_rcon_port(reserved_ports)
            password = secrets.token_urlsafe(32)
            write_server_properties(
                server_dir,
                {
                    "enable-rcon": "true",
                    "rcon.port": str(rcon_port),
                    "rcon.password": password,
                },
            )
        except OSError as error:
            print(f"  {server_dir.name}: could not configure RCON: {error}")
            continue
        reserved_ports.add(rcon_port)
        configured.append(server_dir)
        print(f"  {server_dir.name}: RCON configured on port {rcon_port}; password saved locally in server.properties.")
    return configured


def reload_deployed_servers(server_dirs: List[Path]) -> None:
    running_servers = []
    configured_servers = []
    rcon_disabled = []

    for server_dir in server_dirs:
        properties = read_server_properties(server_dir)
        try:
            server_port = int(properties.get("server-port", "25565"))
            rcon_port = int(properties.get("rcon.port", "25575"))
        except ValueError:
            print(f"  {server_dir.name}: invalid server or RCON port; skipping reload check")
            continue
        if not (1 <= server_port <= 65535 and 1 <= rcon_port <= 65535):
            print(f"  {server_dir.name}: invalid server or RCON port; skipping reload check")
            continue
        if not is_port_open(LOCAL_HOST, server_port):
            continue

        running_servers.append((server_dir, server_port))
        password = properties.get("rcon.password", "")
        if properties.get("enable-rcon", "false").lower() != "true" or not password:
            rcon_disabled.append(server_dir)
            continue
        configured_servers.append((server_dir, server_port, rcon_port, password))

    if not running_servers:
        return

    ports = ", ".join(str(server_port) for _, server_port in running_servers)
    print(f"Detected test server running on [{ports}].")
    if not confirm_reload():
        print("Skipped RCON reload; reload the server manually when ready.")
        return

    if rcon_disabled:
        if confirm_enable_rcon():
            newly_configured = configure_rcon(rcon_disabled)
            if newly_configured:
                print(
                    "RCON settings are saved. Restart these server(s) to activate RCON; "
                    "they cannot be reloaded through RCON during this run: "
                    + ", ".join(server_dir.name for server_dir in newly_configured)
                )
        else:
            print("RCON remains disabled; reload those server(s) manually when ready.")

    if not configured_servers:
        return

    for server_dir, server_port, rcon_port, password in configured_servers:
        try:
            response = send_rcon_command(LOCAL_HOST, rcon_port, password, "reload")
        except (OSError, ConnectionError, PermissionError) as error:
            print(f"  {server_dir.name} [{server_port}]: RCON reload failed: {error}")
            continue
        print(f"  {server_dir.name} [{server_port}]: reload sent.")
        if response.strip():
            print(f"    {response.strip()}")


def main() -> int:
    args = parse_args()
    if not args.no_build:
        run_build()
    artifacts = load_manifest()

    requested = set(args.server or [])
    server_dirs = []
    for candidate in sorted(SERVER_DIR.iterdir()):
        if not candidate.is_dir():
            continue
        if requested and candidate.name not in requested:
            continue
        try:
            version_key(candidate.name)
        except ValueError:
            print(f"Skipping non-version server directory: {candidate.relative_to(ROOT)}")
            continue
        server_dirs.append(candidate)

    if requested:
        missing = requested - {server.name for server in server_dirs}
        if missing:
            raise FileNotFoundError(
                "Requested server directory does not exist or is not a version: "
                + ", ".join(sorted(missing))
            )

    deployment_plan = []
    for server_dir in server_dirs:
        server_version = version_key(server_dir.name)
        artifact = choose_artifact(server_version, artifacts)
        source = ROOT / artifact["path"]
        if not source.is_dir():
            raise FileNotFoundError(f"Built artifact does not exist: {source}")
        deployment_plan.append((server_dir, artifact))

    for server_dir, artifact in deployment_plan:
        deploy_server(server_dir, artifact)
    reload_deployed_servers([server_dir for server_dir, _ in deployment_plan])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
