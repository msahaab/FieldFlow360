#!/bin/sh
set -e

DB_PATH="${DJANGO_DB_PATH:-/db/db.sqlite3}"
DB_DIR="$(dirname "$DB_PATH")"
mkdir -p "$DB_DIR"

python app/manage.py migrate --noinput
python app/manage.py collectstatic --noinput

exec gunicorn ${DJANGO_WSGI_MODULE:-app.app.wsgi}:application \
  --chdir /app/app \
  --bind 0.0.0.0:${PORT:-8000} \
  --workers ${GUNICORN_WORKERS:-3} \
  --timeout 120
