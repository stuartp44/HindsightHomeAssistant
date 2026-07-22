# Hindsight Home Assistant Add-on Repository

[![Release](https://img.shields.io/github/v/release/stuartp44/HindsightHomeAssistant)](https://github.com/stuartp44/HindsightHomeAssistant/releases)

This repository provides a [Home Assistant](https://www.home-assistant.io/) add-on for [Hindsight](https://github.com/vectorize-io/hindsight) — an open-source agent memory system built by [Vectorize.io](https://vectorize.io).

Hindsight gives AI agents persistent, searchable memory via `retain`, `recall`, and `reflect` operations.

## Add-on store installation

1. In Home Assistant go to **Settings → Add-ons → Add-on Store**.
2. Click the menu (⋮) → **Repositories**.
3. Add this URL:
   ```
   https://github.com/stuartp44/HindsightHomeAssistant
   ```
4. Find **Hindsight** in the store and click **Install**.
5. Set your `llm_api_key` in the **Configuration** tab, then click **Start**.
6. Open the **Log** tab — your UI and API access keys are printed there on first start.
7. Click **Open Web UI** and log in with the UI access key.

## What runs

| Service | Port | Purpose |
|---------|------|---------|
| Control Plane UI | `9999` | Web interface — opened by the **Open Web UI** button |
| API | `8888` | REST + MCP endpoint for clients and integrations |

## Security

On first start the add-on auto-generates two random access keys and persists them in `/data/`:

- **UI access key** — required to log in to the Control Plane web UI.
- **API access key** — required as a Bearer token for all API calls.

Both keys survive restarts. To rotate, delete `/data/.cp_access_key` or `/data/.api_access_key` and restart the add-on.

## Configuration options

Option labels and descriptions are translated via `hindsight/translations/en.yaml` (English, default).

| Option | Required | Default | Description |
|--------|----------|---------|-------------|
| `llm_api_key` | Yes | — | API key for your chosen LLM provider (e.g. OpenAI, Anthropic, Gemini) |
| `llm_provider` | No | `openai` | The LLM provider to use for memory extraction and reasoning. Supported: `openai`, `anthropic`, `gemini`, `groq`, `ollama`, `lmstudio`, `minimax`, `atlas` |
| `llm_model` | No | `gpt-4o-mini` | The model name to use with your chosen provider (e.g. `gpt-4o-mini`, `claude-sonnet-4-5`, `gemini-2.0-flash`) |

## API usage

```bash
curl -H "Authorization: Bearer <api_access_key>" \
  http://<your-ha-ip>:8888/v1/default/banks
```

Full API reference: [hindsight.vectorize.io/api-reference](https://hindsight.vectorize.io/api-reference)

## Links

- [Hindsight upstream](https://github.com/vectorize-io/hindsight)
- [Hindsight docs](https://hindsight.vectorize.io)
- [Changelog](hindsight/CHANGELOG.md)
