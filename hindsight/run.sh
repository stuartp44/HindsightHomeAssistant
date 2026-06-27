#!/usr/bin/env bash
set -euo pipefail

OPTIONS_FILE="/data/options.json"

if [[ ! -f "${OPTIONS_FILE}" ]]; then
  echo "ERROR: ${OPTIONS_FILE} not found"
  exit 1
fi

read_config() {
  python3 - "$1" <<'PY'
import json
import sys

key = sys.argv[1]
with open('/data/options.json', 'r', encoding='utf-8') as f:
    data = json.load(f)
val = data.get(key, '')
print(val if val is not None else '')
PY
}

LLM_API_KEY="$(read_config llm_api_key)"
LLM_PROVIDER="$(read_config llm_provider)"
LLM_MODEL="$(read_config llm_model)"
API_PORT="$(read_config api_port)"
UI_PORT="$(read_config ui_port)"

if [[ -z "${LLM_API_KEY}" ]]; then
  echo "ERROR: llm_api_key is required. Set it in the add-on configuration."
  exit 1
fi

mkdir -p /data/.pg0
export PG0_DATA_DIR="/data/.pg0"

export HINDSIGHT_API_LLM_API_KEY="${LLM_API_KEY}"
export HINDSIGHT_API_LLM_PROVIDER="${LLM_PROVIDER:-openai}"
export HINDSIGHT_API_LLM_MODEL="${LLM_MODEL:-gpt-4o-mini}"
export HINDSIGHT_API_HOST="0.0.0.0"
export HINDSIGHT_API_PORT="${API_PORT:-8888}"
export HINDSIGHT_CP_PORT="${UI_PORT:-9999}"
export HINDSIGHT_CP_HOSTNAME="0.0.0.0"
export HINDSIGHT_CP_DATAPLANE_API_URL="http://127.0.0.1:${HINDSIGHT_API_PORT}"
export HINDSIGHT_ENABLE_API="true"
export HINDSIGHT_ENABLE_CP="true"

echo "Starting Hindsight"
echo "  API: ${HINDSIGHT_API_PORT}"
echo "  UI: ${HINDSIGHT_CP_PORT}"
echo "  Provider: ${HINDSIGHT_API_LLM_PROVIDER}"
echo "  Data dir: ${PG0_DATA_DIR}"

exec /app/start-all.sh
