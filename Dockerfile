FROM ubuntu

RUN apt-get update && \
    apt-get install -y cups cups-client cron gettext && \
    rm -rf /var/lib/apt/lists/*

COPY plumber.sh /usr/local/bin/plumber.sh
RUN chmod +x /usr/local/bin/plumber.sh
COPY crontab.template /crontab.template
RUN sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf

COPY patterns /patterns

ENV PRINTER_URL="set PRINTER_URL with real printer url"
ENV PRINTER_MODEL=everywhere
ENV PATTERN_FILE="/patterns/nozzle-check-pattern-pdf-printer-banding-test.pdf"
ENV CRON_SCHEDULE="0 8 * * 1"
ENV LOGFILE="/var/log/plumber.log"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f $LOGFILE