$global:TPADatapackRoot = Split-Path -Parent $PSScriptRoot

function global:Test-TpaDatapackDirectory {
    if ((Get-Location).Provider.Name -ne "FileSystem") {
        return $false
    }

    $root = [IO.Path]::GetFullPath($global:TPADatapackRoot).TrimEnd('\', '/')
    $current = [IO.Path]::GetFullPath((Get-Location).Path)
    return $current.Equals($root, [StringComparison]::OrdinalIgnoreCase) -or
        $current.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)
}

function global:deploy {
    if (-not (Test-TpaDatapackDirectory)) {
        Write-Error "deploy is available only from this project directory or one of its subdirectories."
        return
    }
    $python = Join-Path $global:TPADatapackRoot ".venv\Scripts\python.exe"
    if (-not (Test-Path -LiteralPath $python)) {
        Write-Error "Project venv not found. Run '$global:TPADatapackRoot\scripts\setup-dev.ps1' first."
        return
    }
    & $python (Join-Path $global:TPADatapackRoot "scripts\deploy.py") @args
}

function global:sync_lang {
    if (-not (Test-TpaDatapackDirectory)) {
        Write-Error "sync_lang is available only from this project directory or one of its subdirectories."
        return
    }
    $python = Join-Path $global:TPADatapackRoot ".venv\Scripts\python.exe"
    if (-not (Test-Path -LiteralPath $python)) {
        Write-Error "Project venv not found. Run '$global:TPADatapackRoot\scripts\setup-dev.ps1' first."
        return
    }
    & $python (Join-Path $global:TPADatapackRoot "scripts\lang\sync_lang.py") @args
}
