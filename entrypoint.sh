#!/bin/sh


mkdir -p /tmp
echo -E $CLIENT_SECRET
echo $CLIENT_SECRET > /tmp/client_secrets.json
export GOOGLE_APPLICATION_CREDENTIALS="/tmp/client_secrets.json"

/downloader $DOWNLOAD_FILE_ID $DOWNLOAD_PATH
