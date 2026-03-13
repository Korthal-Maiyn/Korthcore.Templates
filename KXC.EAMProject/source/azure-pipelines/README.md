# Azure Pipelines

Pipelines follow opinionated best practices based on the Azure DevOps Governance pattern.

**Reference:** [Azure DevOps Governance — Julie Ng (Microsoft)](https://github.com/Azure/devops-governance)

## File Structure

```Markdown
├── azure-pipelines/
│   ├── README.md
│   ├── dev.yaml                # PreProd — triggered by feature/*
│   ├── production.yaml         # Prod — triggered by main
│   ├── jobs/
│   │   ├── asset-pipeline.yaml # Module publish to Azure Artifacts
│   │   ├── tests.yaml          # Pester + platyPS
│   │   └── version.yaml        # Semantic version bump
│   ├── steps/
│   │   └── debug-vars.yaml     # Pipeline variable dump for debugging
│   └── vars/
│       ├── global.yaml         # Shared conditions and defaults
│       ├── dev.yaml            # PreProd-specific variables
│       └── prod.yaml           # Prod-specific variables
```

## Triggers

| Pipeline | Branch Trigger | PR Trigger | Action |
|---|---|---|---|
| `dev.yaml` | `feature/*` | `main` | Test only |
| `production.yaml` | `main` | — | Test → Publish module |

## Zero Trust Principle

PRs run tests only — no build or deploy. Only `git merge` events (human-gated) trigger deployments.
Forks, PRs, and scheduled runs are explicitly excluded via `isTrustedCI` in `vars/global.yaml`.
