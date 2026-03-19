#!/bin/sh
set -e

# Default locations inside the container
CONFIG_FILE="/CLIProxyAPI/config.yaml"
ENV_FILE="/CLIProxyAPI/.env"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "config.yaml not found, copying from config.example.yaml..."
    cp /CLIProxyAPI/config.example.yaml "$CONFIG_FILE"
fi

if [ ! -f "$ENV_FILE" ]; then
    echo ".env not found, copying from .env.example..."
    cp /CLIProxyAPI/.env.example "$ENV_FILE"
fi

# Execute the command passed to docker run
exec "$@"
