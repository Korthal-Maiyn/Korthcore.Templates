# Conventions

## Naming

| Type | Pattern | Example |
|---|---|---|
| Module | `KXC.{ProjectName}` | `KXC.EnterpriseAccessModel` |
| Functions | `Verb-EAMNoun.ps1` | `New-EAMSource.ps1` |
| Tests | `Verb-EAMNoun.Tests.ps1` | `New-EAMSource.Tests.ps1` |
| Schema files | `{type}.json` | `account.json` |
| Data files | `{scope}_{descriptor}.csv` | `c1_accesspackages.csv` |
| Branches | `feat/CHG{number}-description` | `feat/CHG0012345-add-c2-filter` |

## Commit Format

Follows [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

```markdown
<type>(<scope>): <short description>

<optional body>

CHG: CHG0012345
```

## Annotations

```powershell
#NOTE: Non-Public Release version in use. PSSailPointBeta
```

Used inline at any call site using a Beta or non-V3 API endpoint.

## Config

`config.psd1` is the `.env` equivalent — never overwritten directly. Each change requires a new CHG and a new git commit. The `ChangeReference` value must match the commit footer.
