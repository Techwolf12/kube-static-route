FROM alpine:3.11

RUN mkdir -p /usr/local/bin /etc/cron.d

COPY crontab /etc/cron.d/root
COPY kube-set-route.sh /usr/local/bin/kube-set-route.sh

RUN chmod 0755 /etc/cron.d/root /usr/local/bin/kube-set-route.sh

CMD crond -l 2 -f -c /etc/cron.d/
