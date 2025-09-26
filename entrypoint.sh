#!/bin/bash -x

cupsd

# Wait for CUPS socket
until lpstat -r; do
  echo "Waiting for CUPS..."
  sleep 2
done

PRINTER_IP=192.168.56.11

lpadmin -p PRINTER -E -v ipp://$PRINTER_IP/ipp/print -m everywhere

cron -f