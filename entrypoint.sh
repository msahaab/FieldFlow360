#!/bin/sh
set -e

DB_PATH="${DJANGO_DB_PATH:-/db/db.sqlite3}"
DB_DIR="$(dirname "$DB_PATH")"
mkdir -p "$DB_DIR"

python app/manage.py migrate --noinput
python app/manage.py collectstatic --noinput

if [ "${DEV_SERVER}" = "1" ]; then
  exec python app/manage.py runserver 0.0.0.0:${PORT:-8000}
fi

exec gunicorn app.app.wsgi:application \
  --bind 0.0.0.0:${PORT:-8000} \
  --workers ${GUNICORN_WORKERS:-3} \
  --timeout 120
