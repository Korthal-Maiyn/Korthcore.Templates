# scripts/

Standalone utility scripts. Not pipeline-managed and not part of the module.

These are ad-hoc or supporting scripts used during development, investigation, or manual operations. They are not exported as module functions and do not require Pester coverage.

## Guidelines

- Scripts here should have a clear, single purpose
- Follow the same comment-based help and coding standards as module functions
- If a script becomes reusable across contexts, consider promoting it to a module function
