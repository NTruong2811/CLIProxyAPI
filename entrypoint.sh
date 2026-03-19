#!/bin/sh
set -e

CONFIG_FILE="/CLIProxyAPI/config.yaml"
ENV_FILE="/CLIProxyAPI/.env"

echo "[entrypoint] Checking environment variables..."
echo "[entrypoint] SECRET_KEY    = ${SECRET_KEY:+(set)}"
echo "[entrypoint] API_KEY_1     = ${API_KEY_1:+(set)}"
echo "[entrypoint] API_KEY_2     = ${API_KEY_2:+(set)}"
echo "[entrypoint] API_KEY_3     = ${API_KEY_3:+(set)}"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "[entrypoint] config.yaml not found, copying from config.example.yaml..."
    cp /CLIProxyAPI/config.example.yaml "$CONFIG_FILE"
fi

if [ ! -f "$ENV_FILE" ]; then
    echo "[entrypoint] .env not found, copying from .env.example..."
    cp /CLIProxyAPI/.env.example "$ENV_FILE"
fi

exec "$@"
