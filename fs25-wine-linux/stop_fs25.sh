#!/usr/bin/env bash
set -euo pipefail

INSTANCE_DIR="${INSTANCE_DIR:-$(pwd)}"

if [ -f "${INSTANCE_DIR}/fs25.pid" ]; then
  PID=$(cat "${INSTANCE_DIR}/fs25.pid" || true)
  if [ -n "${PID}" ] && ps -p "${PID}" >/dev/null 2>&1; then
    kill "${PID}" || true
    sleep 3
  fi
  rm -f "${INSTANCE_DIR}/fs25.pid"
fi

wineserver -k || true
echo "[FS25] Arrêt demandé."
