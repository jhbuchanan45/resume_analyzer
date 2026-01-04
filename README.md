# Resume Analyzer Monorepo

Minimal monorepo for a resume analysis app.

## Apps
- `apps/ui`: Next.js UI
- `apps/analysis_service`: FastAPI backend

## Quick Start
```bash
pnpm install
pnpm dev
```

## Common Tasks
```bash
pnpm build       # build all apps
pnpm lint        # lint workspace
pnpm check-sec   # security checks
```

## OpenAPI Auto-Export
Staged changes in `apps/analysis_service` auto-generate and commit the FastAPI OpenAPI spec via a Husky pre-commit hook.

- Output: apps/analysis_service/openapi.json
- Hook: .husky/pre-commit
- Script: scripts/export_openapi_on_changes.sh

Prerequisite: install `uv` to run the export.
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```


