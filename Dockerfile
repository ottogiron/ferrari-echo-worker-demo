from node:4.5.0

COPY . /app

RUN curl -SLO https://github.com/ottogiron/ferrariworker/releases/download/0.6.0/ferrariworker.linux-amd64.tar.gz \
    && tar -xzvf ferrariworker.linux-amd64.tar.gz  \
    && mv ferrariworker /usr/local/bin/ferrariworker \
    && chmod +x /app/entrypoint.sh


ENTRYPOINT ["/app/entrypoint.sh"]

