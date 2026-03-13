# Ops Runbook

Operational reference for executing KXC.EnterpriseAccessModel in Production.

## Pre-Flight Checklist

- [ ] CHG approved and reference number confirmed
- [ ] `config.psd1` reviewed — correct environment, CHG reference, and OrgUrl
- [ ] `EnableProvisioning` set per change intent
- [ ] All Pester tests passing on `feature/*` branch
- [ ] PR approved and merged to `main`

## Execution

Execution is pipeline-driven. A merge to `main` triggers `production.yaml` automatically.

Manual execution (break-glass only):

```powershell
# From repo root
Import-Module .\KXC.EnterpriseAccessModel\KXC.EnterpriseAccessModel.psd1
.\main.ps1 -Verbose
```

## Rollback

> Document rollback steps specific to this deployment here.
