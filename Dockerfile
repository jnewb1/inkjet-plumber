FROM ubuntu

RUN apt-get update && \
    apt-get install -y cups cups-client cron gettext && \
    rm -rf /var/lib/apt/lists/*

COPY plumber.sh /usr/local/bin/plumber.sh
COPY crontab.template /crontab.template

COPY patterns /patterns

ENV PRINTER_URL="set PRINTER_URL with real printer url"
ENV PRINTER_MODEL=everywhere
ENV PATTERN_FILE="/patterns/nozzle-check-pattern-pdf-printer-banding-test.pdf"
ENV CRON_SCHEDULE="* 8 * * 1"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron", "-f"]
