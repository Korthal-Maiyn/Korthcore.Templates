# Architecture

## Execution Flow

Documents the function call order, resource dependencies, and data flow through the module.

> Populate this file with the execution diagram and dependency notes for this deployment.

## Dependency Order

Functions in `main.ps1` must execute in dependency order:

1. Transforms — must exist before provisioning policies reference them
2. Source — ID required by all subsequent steps
3. Source Schema
4. Provisioning Policy
5. Source Filters
6. Correlation Config
7. Aggregation Schedule
