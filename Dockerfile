FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
RUN chmod +x /app/entrypoint.sh


RUN useradd -u 1000 -m appuser && chown -R appuser:appuser /app

RUN mkdir -p /data /app/staticfiles /app/media \
    && chown -R appuser:appuser /data /app/staticfiles /app/media

USER appuser

ENV GUNICORN_WORKERS=3 \
    PORT=8000

CMD ["/app/entrypoint.sh"]
