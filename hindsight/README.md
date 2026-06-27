# Hindsight Home Assistant Add-on

This add-on wraps the official `ghcr.io/vectorize-io/hindsight:latest` image and exposes the Hindsight UI in Home Assistant via Ingress.

## Included runtime

- Image: `ghcr.io/vectorize-io/hindsight:latest`
- API: internal port `8888` (configurable)
- Control Plane UI: internal port `9999` (configurable, used by Ingress)

## Add-on options

- `llm_api_key`: Required. Exported to `HINDSIGHT_API_LLM_API_KEY`.
- `llm_provider`: Default `openai`. Also supports `anthropic`, `gemini`, `groq`, `ollama`, `lmstudio`, `minimax`, `atlas`.
- `llm_model`: Default `gpt-4o-mini`.
- `api_port`: Internal API port (default `8888`).
- `ui_port`: Internal UI port (default `9999`, this is the Ingress target).

## Install in Home Assistant

1. Push this repo to GitHub.
2. In Home Assistant, go to Add-on Store.
3. Click menu -> Repositories.
4. Add repository URL:
   - `https://github.com/stuartp44/HindsightHomeAssistant`
5. Open the Hindsight add-on, install, configure `llm_api_key` (and provider/model if needed), then start.
6. Open the sidebar panel named Hindsight.

## Config page

- Open `config-page.html` from this repository root in your browser.
- Fill out the form fields.
- Click `Generate YAML`.
- Copy or download the generated `repository.yaml` and `config.yaml` content.

## Notes

- This scaffold is for Home Assistant OS/Supervised add-ons.
- If you run Home Assistant Container/Core, run Hindsight separately and embed it via panel iframe.
- Data is persisted to `/data/.pg0` inside the add-on container.
- The startup script reads options as root, then runs Hindsight as an unprivileged user so embedded PostgreSQL can initialize cleanly.

## CI and releases

- A minimal CI pipeline runs on push/PR at `.github/workflows/ci.yml`.
- Commit message linting runs on pull requests at `.github/workflows/commit-lint.yml`.
- CI currently verifies:
   - `hindsight/run.sh` shell syntax
   - required keys in `repository.yaml`
   - required keys in `hindsight/config.yaml`
   - no remaining legacy URL references
- Release Please runs on pushes to `main` at `.github/workflows/release-please.yml`.
- Release version state is tracked in `.release-please-manifest.json` and configured via `.release-please-config.json`.
- Release PRs also update `hindsight/config.yaml` (`version`) automatically via Release Please `extra-files`.
- Release Please writes add-on release notes to `hindsight/CHANGELOG.md` so Home Assistant can display changelog entries.
- Release Please uses the workflow token context (`GITHUB_TOKEN`). Ensure repository/org Actions settings allow this token to create pull requests.
- Use Conventional Commit style messages (`feat:`, `fix:`, `chore:`) so Release Please can generate release PRs and tags correctly.
