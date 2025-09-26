#!/bin/bash -ex

cupsd

# Wait for CUPS socket
until lpstat -r; do
  echo "Waiting for CUPS..."
  sleep 2
done

envsubst < /crontab.template > /etc/cron.d/plumber
chmod 0644 /etc/cron.d/plumber
crontab /etc/cron.d/plumber

lpadmin -p PRINTER -E -v "$PRINTER_URL" -m $PRINTER_MODEL

exec "$@"