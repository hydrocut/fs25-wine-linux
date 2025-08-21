#!/usr/bin/env bash
set -euo pipefail

INSTANCE_DIR="${INSTANCE_DIR:-$(pwd)}"
WINEPREFIX="${INSTANCE_DIR}/wineprefix"
SERVER_DIR="${INSTANCE_DIR}/server"
LOG_DIR="${INSTANCE_DIR}/logs"
PROFILE_DIR="${INSTANCE_DIR}/profile"

mkdir -p "${LOG_DIR}" "${PROFILE_DIR}"

GAME_PORT="${GAME_PORT:-${GamePort}}"
QUERY_PORT="${QUERY_PORT:-${QueryPort}}"
WEB_PORT="${WEB_PORT:-${WebPort}}"

cd "${SERVER_DIR}"

export WINEPREFIX
export WINEDEBUG=-all
export WINEARCH=win64

xvfb-run -a wine "${SERVER_DIR}/dedicatedServer.exe" \
  -port "${GAME_PORT}" \
  -webPort "${WEB_PORT}" \
  -profile "${PROFILE_DIR}" \
  -logdir "${LOG_DIR}" \
  >> "${LOG_DIR}/fs25_console.log" 2>&1 &

echo $! > "${INSTANCE_DIR}/fs25.pid"
echo "[FS25] Démarré - Web:${WEB_PORT} Jeu:${GAME_PORT} PID $(cat ${INSTANCE_DIR}/fs25.pid)"
