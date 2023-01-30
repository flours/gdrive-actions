FROM go:1.17

WORKDIR /src
COPY ./src /src
COPY entrypoint.sh ./
RUN chmod +x /scripts/entrypoint.sh
WORKDIR /work
VOLUME ["/work"]
ENTRYPOINT /src/entrypoint.sh
