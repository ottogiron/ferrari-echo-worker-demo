from node:4.5.0

COPY . /app

RUN curl -SLO https://github.com/ottogiron/ferrariworker/releases/download/0.5.2/ferrariworker-linux \
    && chmod +x ferrariworker-linux \
    && mv ferrariworker-linux /usr/local/bin/ferrariworker \
    && chmod +x /app/entrypoint.sh


ENTRYPOINT ["/app/entrypoint.sh"]

