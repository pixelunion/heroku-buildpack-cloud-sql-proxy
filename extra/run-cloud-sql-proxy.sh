#!/usr/bin/env bash
printf "%s" "$GCLOUD_CREDENTIALS" | base64 --decode > /app/google/credentials.json
echo "🔐 Starting Cloud SQL Proxy: $GCLOUD_INSTANCE"
exec /app/google/bin/cloud-sql-proxy \
  "$GCLOUD_INSTANCE" \
  --credentials-file=/app/google/credentials.json \
  --max-sigterm-delay=30 \
  &
