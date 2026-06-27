FROM ghcr.io/vectorize-io/hindsight:latest

USER root

RUN id -u hindsight >/dev/null 2>&1 || useradd --create-home --shell /bin/bash hindsight

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
