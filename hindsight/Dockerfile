FROM ghcr.io/vectorize-io/hindsight:0.8.4

USER root

RUN id -u hindsight >/dev/null 2>&1 || useradd --create-home --shell /bin/bash hindsight

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
