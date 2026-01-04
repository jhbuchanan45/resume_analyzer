#!/usr/bin/env bash
set -euo pipefail

# Check for staged changes within the analysis_service
if git diff --cached --name-only | grep -q '^apps/analysis_service/'; then
  echo "Detected changes in apps/analysis_service; exporting OpenAPI spec..."
  (
    cd apps/analysis_service
    if command -v uv >/dev/null 2>&1; then
      uv run python src/export_openapi.py
    else
      echo "uv not found; cannot export OpenAPI spec." >&2
      exit 1
    fi
  )

  # Stage the generated OpenAPI file so it is included in the commit
  git add apps/analysis_service/openapi.json
fi
