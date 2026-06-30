#!/bin/sh

DATA_DIR="/app/did-hosting-daemon/data/daemon"
CONFIG_FILE="/app/did-hosting-daemon/config.toml"

if [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A "$DATA_DIR" 2>/dev/null)" ] || [ ! -f "$CONFIG_FILE" ]; then
  [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A "$DATA_DIR" 2>/dev/null)" ] && echo "No data found."
  [ ! -f "$CONFIG_FILE" ] && echo "No config found."
  echo "Please run: kubectl exec -it <pod> -- did-hosting-daemon setup"
  echo "Holding container..."
  sleep infinity
fi

echo "Data found, starting did-hosting-daemon..."
exec did-hosting-daemon
