# runbooks/

Azure Automation Runbooks that consume the published `KXC.EnterpriseAccessModel` module from Azure Artifacts.

## Structure

Each runbook lives in its own named subfolder matching the runbook name:

```Markdown
runbooks/
└── {RunbookName}/
    ├── {RunbookName}.ps1
    └── README.md
```

## Convention

The folder name must match the `.ps1` filename (without extension). This ensures correct mapping during pipeline deployment.

Every runbook must begin with:

```powershell
Import-Module KXC.EnterpriseAccessModel
```

Runbooks do not contain business logic — they are thin wrappers that invoke module functions.
