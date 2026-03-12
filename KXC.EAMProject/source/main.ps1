#Requires -Version 7.0
#Requires -Modules PSSailPoint, PSSailPointBeta, Az.KeyVault
<#
    .SYNOPSIS
        Orchestrator for KXC.EnterpriseAccessModel deployment.

    .DESCRIPTION
        Imports the KXC.EnterpriseAccessModel module, reads config.psd1, and
        calls functions in dependency order to deploy the Enterprise Access Model
        configuration to SailPoint Identity Security Cloud.

        Execution order reflects resource dependency — do not reorder:
          1. Transforms must exist before provisioning policies reference them.
          2. Source ID is required by all subsequent steps.

    .NOTES
        Author  : <%=$PLASTER_PARAM_Author%>
        Created : <%=$PLASTER_DATE%>

        Always review config.psd1 before executing. Ensure EnableProvisioning
        is explicitly set per change intent.
#>

[CmdletBinding(SupportsShouldProcess)]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# -----------------------------------------------------------------------
# Bootstrap
# -----------------------------------------------------------------------
$ModuleManifest = Join-Path -Path $PSScriptRoot -ChildPath 'KXC.EnterpriseAccessModel\KXC.EnterpriseAccessModel.psd1'
$ConfigPath     = Join-Path -Path $PSScriptRoot -ChildPath 'config.psd1'

Import-Module -Name $ModuleManifest -Force
$Config = Import-PowerShellDataFile -Path $ConfigPath

Write-Verbose "Environment  : $($Config.Environment)"
Write-Verbose "Change Ref   : $($Config.ChangeReference)"
Write-Verbose "Scopes       : $($Config.Scopes -join ', ')"
Write-Verbose "Provisioning : $($Config.EnableProvisioning)"

# -----------------------------------------------------------------------
# Execution — do not reorder
# -----------------------------------------------------------------------
New-EAMScopeTransforms     -Scopes $Config.Scopes -Config $Config
New-EAMSource              -Scopes $Config.Scopes -Config $Config
New-EAMSourceSchema        -Scopes $Config.Scopes -Config $Config
New-EAMProvisioningPolicy  -Scopes $Config.Scopes -Config $Config
Set-EAMSourceFilters       -Scopes $Config.Scopes -Config $Config
Set-EAMCorrelationConfig   -Scopes $Config.Scopes -Config $Config    #NOTE: Non-Public Release version in use. PSSailPointBeta
Set-EAMAggregationSchedule -Scopes $Config.Scopes -Config $Config    #NOTE: Non-Public Release version in use. PSSailPointBeta