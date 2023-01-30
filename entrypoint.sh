#!/bin/sh


mkdir -p /tmp
echo $CLIENT_SECRET > /tmp/client_secrets.json
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/client_secrets.json

go run /src/main.go $DOWNLOAD_FILE_ID $DOWNLOAD_PATH
