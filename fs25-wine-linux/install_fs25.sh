#!/usr/bin/env bash
set -euo pipefail

INSTANCE_DIR="${INSTANCE_DIR:-$(pwd)}"
WINEPREFIX="${INSTANCE_DIR}/wineprefix"

mkdir -p "${INSTANCE_DIR}/server" "${INSTANCE_DIR}/logs" "${WINEPREFIX}"

if [ ! -d "${WINEPREFIX}/drive_c" ]; then
  echo "[FS25] Initialisation du WINEPREFIX..."
  WINEPREFIX="${WINEPREFIX}" wineboot -i
fi

# Dépose ton zip/dossier du serveur FS25 dans l'instance
if [ ! -f "${INSTANCE_DIR}/server/dedicatedServer.exe" ]; then
  if [ -f "${INSTANCE_DIR}/FarmingSimulator25Dedicated.zip" ]; then
    unzip -o "${INSTANCE_DIR}/FarmingSimulator25Dedicated.zip" -d "${INSTANCE_DIR}/server"
  fi
fi

if [ ! -f "${INSTANCE_DIR}/server/dedicatedServer.exe" ]; then
  echo "[ERREUR] dedicatedServer.exe introuvable."
  echo "Copie manuellement le dossier du serveur FS25 dans ${INSTANCE_DIR}/server/"
  exit 1
fi

echo "[FS25] Installation terminée."
