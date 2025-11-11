#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(pwd)"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_JSON="$REPO_ROOT/.devcontainer/devcontainer.json"

echo "[universal-devcontainer] Config: $CONFIG_JSON"
echo "[universal-devcontainer] Workspace: $PROJECT_DIR"

if ! command -v devcontainer >/dev/null 2>&1; then
  echo "[universal-devcontainer] Dev Containers CLI not found." >&2
  echo "Install it: npm i -g @devcontainers/cli" >&2
  exit 1
fi

echo "[universal-devcontainer] Launching via Dev Containers CLI..."
exec devcontainer open --config "$CONFIG_JSON" --workspace-folder "$PROJECT_DIR"
