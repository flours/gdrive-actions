FROM golang:1.17 AS builder

WORKDIR /src
COPY ./src /src
RUN go build -o downloader main.go

FROM golang:1.17

WORKDIR /src
COPY --from=builder /src/downloader /downloader
COPY entrypoint.sh ./
RUN chmod +x /src/entrypoint.sh
RUN chmod +x /downloader
WORKDIR /work
VOLUME ["/work"]
ENTRYPOINT /src/entrypoint.sh
