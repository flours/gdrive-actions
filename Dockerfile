FROM golang:1.17

WORKDIR /src
COPY ./src /src
COPY entrypoint.sh ./
RUN chmod +x /src/entrypoint.sh
WORKDIR /work
VOLUME ["/work"]
ENTRYPOINT /src/entrypoint.sh
