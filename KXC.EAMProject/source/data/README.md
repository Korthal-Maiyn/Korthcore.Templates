# data/

External data inputs consumed by module functions. Never hardcoded in scripts.

| Path | Purpose |
|---|---|
| `*.csv` | Bulk data files (e.g. Access Packages, scoped entitlements) |
| `templates/` | Static template files (e.g. email HTML) |

## Naming Convention

```Markdown
{scope}_{descriptor}.csv
```

Example: `c1_accesspackages.csv`, `c2_governancegroups.csv`

## Usage

Scripts reference data files via a `-DataSet` parameter or `Import-Csv` piped as object input. Data files are never imported inline inside functions.
