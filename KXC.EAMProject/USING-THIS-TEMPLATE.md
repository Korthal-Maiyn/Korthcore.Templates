# Using the KXC.EAMProject Plaster Template

This guide covers how to install Plaster and use the `KXC.EAMProject` template to scaffold a new `KXC.EnterpriseAccessModel` project locally.

---

## Prerequisites

All prerequisites must be installed before running the template. Plaster will verify required modules at scaffold time and warn if any are missing.

```powershell
# Install Plaster
Install-Module Plaster -Scope CurrentUser -Force

# Install required project modules
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module Pester           -Scope CurrentUser -SkipPublisherCheck -Force
Install-Module platyPS          -Scope CurrentUser -Force
Install-Module PSScriptAnalyzer -Scope CurrentUser -Force
Install-Module PSSailPoint      -Scope CurrentUser -Force
Install-Module PSSailPointBeta  -Scope CurrentUser -Force
Install-Module Az.KeyVault      -Scope CurrentUser -Force
```

> **Note:** `Pester` requires `-SkipPublisherCheck` as the version bundled with Windows is signed differently from the Gallery release.

---

## Cloning the Templates Repository

The template lives in the `Korthcore.Templates` repository. Clone it locally so Plaster can reference it directly.

```powershell
git clone https://github.com/Korthal-Maiyn/Korthcore.Templates.git
```

---

## Scaffolding a New Project

Navigate to where you want the new project created, then invoke Plaster pointing at the `KXC.EAMProject` template folder.

```powershell
# Set the path to the cloned template
$TemplatePath    = 'C:\path\to\Korthcore.Templates\KXC.EAMProject'

# Set the destination for the new project
$DestinationPath = 'C:\Projects\KXC.EnterpriseAccessModel'

# Run Plaster
Invoke-Plaster -TemplatePath $TemplatePath -DestinationPath $DestinationPath
```

Plaster will prompt for the following:

| Prompt | Description | Default |
|---|---|---|
| Author name | Your name — written into module manifest and main.ps1 | Git user.name |
| Author email | Your email — written into README.md | Git user.email |
| Initial module version | Semantic version for the module manifest | `0.1.0` |
| Target environment | `PreProd` or `Prod` — written into config.psd1 | `PreProd` |
| Change reference | CHG number for this scaffold — written into config.psd1 | `CHG0000000` |

---

## After Scaffolding

Once Plaster completes, perform the following steps before starting development.

### 1. Review `config.psd1`

Update the `OrgUrl`, `KeyVaultName`, and `SecretNames` values to match your environment. The `ChangeReference` and `Environment` are pre-populated from your prompt responses.

```powershell
code .\config.psd1
```

### 2. Initialise the git repository

```powershell
cd $DestinationPath
git init
git add .
git commit -m "chore(structure): initial project scaffold

CHG: CHG0000000"
```

### 3. Connect to remote

```powershell
git remote add origin https://github.com/Korthal-Maiyn/KXC.EnterpriseAccessModel.git
git push -u origin main
```

### 4. Verify the module imports cleanly

```powershell
Import-Module .\KXC.EnterpriseAccessModel\KXC.EnterpriseAccessModel.psd1 -Verbose
```

No errors at this stage confirms the scaffold is valid before any functions are added.

---

## Scaffolded Structure

After running the template, your project will contain the following layout. Refer to `docs/PROJECT_STRUCTURE.md` for full detail on each area.

```Markdown
/ (repo root)
├── .gitignore
├── .gitattributes
├── README.md
├── CHANGELOG.md
├── config.psd1
├── main.ps1
├── .vscode/
├── azure-pipelines/
├── data/
├── docs/
├── KXC.EnterpriseAccessModel/
│   ├── KXC.EnterpriseAccessModel.psd1
│   ├── KXC.EnterpriseAccessModel.psm1
│   ├── public/
│   ├── private/
│   ├── schemas/
│   ├── tests/
│   └── docs/
├── runbooks/
└── scripts/
```

---

## Troubleshooting

**Plaster reports a missing module**
Run the prerequisites block above. Plaster will re-verify on the next invocation.

**`Invoke-Plaster` is not recognised**
Confirm Plaster installed correctly:

```powershell
Get-Module Plaster -ListAvailable
```

If missing, re-run `Install-Module Plaster -Scope CurrentUser -Force` and restart your terminal.

**Destination already exists**
Plaster will prompt to overwrite individual files. To scaffold into a clean directory, ensure `$DestinationPath` does not already exist or is empty.

**Line ending issues on Windows**
The `.gitattributes` file normalises all line endings to LF on check-in. If you see warnings locally, this is expected — git will handle normalisation on commit.

---

## References

- [Plaster — PowerShell Gallery](https://www.powershellgallery.com/packages/Plaster)
- [Plaster — GitHub](https://github.com/PowerShellOrg/Plaster)
- [Plaster Documentation](https://github.com/PowerShellOrg/Plaster/blob/master/docs/en-US/about_Plaster.help.md)
