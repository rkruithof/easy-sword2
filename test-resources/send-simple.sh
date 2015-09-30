#!/bin/sh

CONTENT_TYPE=application/zip
FILENAME=$1
MD5=`md5 -q $FILENAME`
USERNAME=user001
PASSWORD=user001
TARGET=$2
IN_PROGRESS=false

curl -v -H "Content-Type: $CONTENT_TYPE" -H "Content-Disposition: attachment; filename=$FILENAME" -H "Packaging: http://easy.dans.knaw.nl/schemas/EASY-BagIt.html" -H "Content-MD5: $MD5"  -H "In-Progress: $IN_PROGRESS" -i -u $USERNAME:$PASSWORD  --data-binary @"$FILENAME"  $TARGET

