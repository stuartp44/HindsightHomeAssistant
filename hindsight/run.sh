#!/usr/bin/env bash
set -euo pipefail

OPTIONS_FILE="/data/options.json"
APP_USER="hindsight"
APP_HOME="/home/${APP_USER}"

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

if [[ -z "${LLM_API_KEY}" ]]; then
  echo "ERROR: llm_api_key is required. Set it in the add-on configuration."
  exit 1
fi

mkdir -p /data/.pg0
export PG0_DATA_DIR="/data/.pg0"

if id -u "${APP_USER}" >/dev/null 2>&1; then
  chown -R "${APP_USER}:${APP_USER}" /data/.pg0
fi

# Symlink the hindsight user's home pg0 dir to /data/.pg0 to ensure
# data persists across container restarts regardless of which path
# the embedded PostgreSQL uses as its default data directory.
APP_HOME_PG0="${APP_HOME}/.pg0"
if [[ ! -L "${APP_HOME_PG0}" ]]; then
  rm -rf "${APP_HOME_PG0}"
  ln -sf /data/.pg0 "${APP_HOME_PG0}"
fi

export HINDSIGHT_API_LLM_API_KEY="${LLM_API_KEY}"
export HINDSIGHT_API_LLM_PROVIDER="${LLM_PROVIDER:-openai}"
export HINDSIGHT_API_LLM_MODEL="${LLM_MODEL:-gpt-4o-mini}"
export HINDSIGHT_API_HOST="0.0.0.0"
export HINDSIGHT_API_PORT="8888"
export HINDSIGHT_CP_PORT="9999"
export HINDSIGHT_CP_HOSTNAME="0.0.0.0"

export HINDSIGHT_CP_DATAPLANE_API_URL="http://127.0.0.1:${HINDSIGHT_API_PORT}"

# Auto-generate persistent access keys on first run
CP_KEY_FILE="/data/.cp_access_key"
if [[ ! -f "${CP_KEY_FILE}" ]]; then
  python3 -c 'import secrets; print(secrets.token_urlsafe(32))' > "${CP_KEY_FILE}"
  chmod 600 "${CP_KEY_FILE}"
fi
export HINDSIGHT_CP_ACCESS_KEY="$(cat "${CP_KEY_FILE}")"

API_KEY_FILE="/data/.api_access_key"
if [[ ! -f "${API_KEY_FILE}" ]]; then
  python3 -c 'import secrets; print(secrets.token_urlsafe(32))' > "${API_KEY_FILE}"
  chmod 600 "${API_KEY_FILE}"
fi
export HINDSIGHT_API_TENANT_EXTENSION="hindsight_api.extensions.builtin.tenant:ApiKeyTenantExtension"
export HINDSIGHT_API_TENANT_API_KEY="$(cat "${API_KEY_FILE}")"
export HINDSIGHT_CP_DATAPLANE_API_KEY="$(cat "${API_KEY_FILE}")"

export HINDSIGHT_ENABLE_API="true"
export HINDSIGHT_ENABLE_CP="true"

echo "Starting Hindsight"
echo "  API: ${HINDSIGHT_API_PORT}"
echo "  UI: ${HINDSIGHT_CP_PORT}"
echo "  Provider: ${HINDSIGHT_API_LLM_PROVIDER}"
echo "  Data dir: ${PG0_DATA_DIR}"
echo "  UI access key: ${HINDSIGHT_CP_ACCESS_KEY}"
echo "  API access key: ${HINDSIGHT_API_TENANT_API_KEY}"

if [[ "$(id -u)" -eq 0 ]]; then
  echo "Starting as non-root user: ${APP_USER}"
  mkdir -p "${APP_HOME}"
  if id -u "${APP_USER}" >/dev/null 2>&1; then
    chown "${APP_USER}:${APP_USER}" "${APP_HOME}"
  fi
  echo "  Home dir: ${APP_HOME}"
  exec env HOME="${APP_HOME}" su -m -s /bin/bash -c "/app/start-all.sh" "${APP_USER}"
fi

exec /app/start-all.sh
