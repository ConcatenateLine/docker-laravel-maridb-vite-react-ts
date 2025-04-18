#!/bin/bash
set -e

if [ ! -f package.json ]; then
  echo "No package.json found and directory is otherwise empty, creating new Vite + React project..."
  npm create vite@latest . -- --template react-ts --force

else
  echo "Directory is not empty (other than .env, Dockerfile, entrypoint); skipping Vite project creation."
fi

if [ -f vite.config.ts ]; then
  rm /app/vite.config.ts
fi

  cp /vite.config.ts /app/vite.config.ts


npm install

exec "$@"