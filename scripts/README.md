# Developer commands

Run this once in PowerShell from any location inside this checkout:

```powershell
& "<checkout>\scripts\setup-dev.ps1"
```

The setup script creates the checkout-local `.venv`, installs
`requirements.txt`, and adds this checkout's `dev_commands.ps1` to the current
user's PowerShell profile. Open a new PowerShell session, or run `. $PROFILE` in
the current one. Then `deploy` and `sync_lang` work from this checkout and its
subdirectories; outside this project tree, both commands refuse to run.

Each developer runs setup once per checkout. Do not copy `.venv` between
machines: it contains interpreter-specific paths and is intentionally local.
The profile only stores a path to this checkout; the command definitions live
in `dev_commands.ps1` in the repository.

The setup is repeated once on each computer and checkout. A Python installation
and network access to install the declared requirements are needed. The venv's
`Activate.ps1` is generated locally; it is not committed or copied.
