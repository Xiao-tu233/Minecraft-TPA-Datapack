param(
    [switch]$SkipVenv,
    [switch]$NoProfile
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$venvPython = Join-Path $repoRoot ".venv\Scripts\python.exe"

if (-not $SkipVenv) {
    if (-not (Test-Path -LiteralPath $venvPython)) {
        $pythonLauncher = Get-Command py -ErrorAction SilentlyContinue
        if ($pythonLauncher) {
            & $pythonLauncher.Source -3 -m venv (Join-Path $repoRoot ".venv")
        } else {
            $pythonLauncher = Get-Command python -ErrorAction Stop
            & $pythonLauncher.Source -m venv (Join-Path $repoRoot ".venv")
        }
        if ($LASTEXITCODE -ne 0) {
            throw "Could not create the project venv using the installed Python launcher."
        }
    }

    & $venvPython -m pip install -r (Join-Path $repoRoot "scripts\requirements.txt")
    if ($LASTEXITCODE -ne 0) {
        throw "Could not install project Python requirements."
    }
}

if (-not $NoProfile) {
    $profilePath = $PROFILE
    $profileDirectory = Split-Path -Parent $profilePath
    if (-not (Test-Path -LiteralPath $profileDirectory)) {
        New-Item -ItemType Directory -Path $profileDirectory -Force | Out-Null
    }

    $sourcePath = Join-Path $PSScriptRoot "dev_commands.ps1"
    $escapedSourcePath = $sourcePath.Replace("'", "''")
    $profileLine = ". '$escapedSourcePath'"
    $profileContent = if (Test-Path -LiteralPath $profilePath) {
        Get-Content -LiteralPath $profilePath -Raw
    } else {
        ""
    }

    if ($profileContent -notmatch [regex]::Escape($profileLine)) {
        Add-Content -LiteralPath $profilePath -Value "`n# Minecraft-TPA-Datapack developer commands`n$profileLine" -Encoding utf8
    }
    Write-Host "PowerShell commands registered in $profilePath"
    Write-Host "Run '. `$PROFILE' now, or open a new PowerShell terminal."
}

if (-not $SkipVenv) {
    Write-Host "Project Python environment ready: $venvPython"
}
