FROM ubuntu

RUN apt-get update && \
    apt-get install -y cups cups-client cron && \
    rm -rf /var/lib/apt/lists/*

COPY plumber.sh /usr/local/bin/plumber.sh
COPY crontab.txt /etc/cron.d/plumber

RUN chmod +x /usr/local/bin/printjob && \
    chmod 0644 /etc/cron.d/print-cron && \
    crontab /etc/cron.d/print-cron

CMD service cron start && cupsd -f
