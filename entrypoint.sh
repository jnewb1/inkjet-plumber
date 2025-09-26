#!/bin/bash -x

cupsd

# Wait for CUPS socket
until lpstat -r; do
  echo "Waiting for CUPS..."
  sleep 2
done

lpadmin -p PRINTER -E -v $PRINTER_URL -m $PRINTER_MODEL

cron -f