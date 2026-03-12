# KXC.EnterpriseAccessModel

> SailPoint ISC automation for the Enterprise Access Model.

## Overview

This repository contains the `KXC.EnterpriseAccessModel` PowerShell module and all associated pipelines, runbooks, configuration, schemas, and data required to deploy and maintain the Enterprise Access Model in SailPoint Identity Security Cloud.

## Quick Start

```powershell
# Install required modules
Install-Module PSSailPoint         -Scope CurrentUser
Install-Module PSSailPointBeta     -Scope CurrentUser
Install-Module Az.KeyVault         -Scope CurrentUser
Install-Module Pester              -Scope CurrentUser -SkipPublisherCheck
Install-Module platyPS             -Scope CurrentUser
Install-Module PSScriptAnalyzer    -Scope CurrentUser

# Import the module locally
Import-Module .\KXC.EnterpriseAccessModel\KXC.EnterpriseAccessModel.psd1

# Review config before executing
Get-Content .\config.psd1

# Execute
.\main.ps1
```

## Repository Structure

See [docs/PROJECT_STRUCTURE.md](docs/PROJECT_STRUCTURE.md) for the full structure reference.

## Maintainers

- <%=$PLASTER_PARAM_Author%> [<%=$PLASTER_PARAM_Email%>](mailto:<%=$PLASTER_PARAM_Email%>)

## Branch Strategy

| Branch | Pipeline | Target |
|---|---|---|
| `feature/*` | `dev.yaml` | PreProd |
| `main` | `production.yaml` | Prod |

All merges to `main` require a CHG reference in the commit footer.