import json
from pathlib import Path

# Import FastAPI app defined in main.py
from main import app


def export_openapi() -> None:
    """Generate OpenAPI spec from FastAPI app and write to openapi.json."""
    spec = app.openapi()

    # Write to service root: apps/analysis_service/openapi.json
    out_path = Path(__file__).resolve().parents[1] / "openapi.json"
    out_path.write_text(json.dumps(spec, indent=2))


if __name__ == "__main__":
    export_openapi()
