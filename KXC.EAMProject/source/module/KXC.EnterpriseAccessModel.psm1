#Requires -Version 7.0
<#
    .SYNOPSIS
        Root module file for KXC.EnterpriseAccessModel.

    .DESCRIPTION
        Dot-sources all public and private functions at import time.
        Do not add business logic here — functions belong in public/ or private/.
#>

# Dot-source private functions first — public functions may depend on them
$Private = Get-ChildItem -Path "$PSScriptRoot\private\*.ps1" -ErrorAction SilentlyContinue
$Public  = Get-ChildItem -Path "$PSScriptRoot\public\**\*.ps1" -Recurse -ErrorAction SilentlyContinue

foreach ($Function in @($Private + $Public)) {
    try {
        . $Function.FullName
    }
    catch {
        Write-Error "Failed to import function '$($Function.FullName)': $_"
    }
}

# Export public functions only
Export-ModuleMember -Function $Public.BaseName