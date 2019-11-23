#!/bin/sh -l

set -e

OUTPUT_PDF="file1.txt"

echo '{
  "message": "'"update $OUTPUT_PDF"'",
  "committer": {
    "name": "Tectonic Action",
    "email": "tectonic-action@github.com"
  },
  "content": "'"$(base64 -w 0 $OUTPUT_PDF)"'",
  "sha": '$(curl -X GET https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF | jq .sha)'
}' > payload.json

STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" \
            -i -X PUT -H "Authorization: token $GITHUB_TOKEN" -d @payload.json \
            https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF)

if [ $((STATUSCODE/100)) -ne 2 ]; then
  echo "Github's API returned $STATUSCODE"
  exit 22;
fi


OUTPUT_PDF="file.txt"

echo '{
  "message": "'"update $OUTPUT_PDF"'",
  "committer": {
    "name": "Tectonic Action",
    "email": "tectonic-action@github.com"
  },
  "content": "'"$(base64 -w 0 $OUTPUT_PDF)"'",
  "sha": '$(curl -X GET https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF | jq .sha)'
}' > payload.json

STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" \
            -i -X PUT -H "Authorization: token $GITHUB_TOKEN" -d @payload.json \
            https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF)

if [ $((STATUSCODE/100)) -ne 2 ]; then
  echo "Github's API returned $STATUSCODE"
  exit 22;
fi


OUTPUT_PDF="file2.txt"

echo '{
  "message": "'"update $OUTPUT_PDF"'",
  "committer": {
    "name": "Tectonic Action",
    "email": "tectonic-action@github.com"
  },
  "content": "'"$(base64 -w 0 $OUTPUT_PDF)"'",
  "sha": '$(curl -X GET https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF | jq .sha)'
}' > payload.json

STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" \
            -i -X PUT -H "Authorization: token $GITHUB_TOKEN" -d @payload.json \
            https://api.github.com/repos/vinay0410/webpage/contents/$OUTPUT_PDF)

if [ $((STATUSCODE/100)) -ne 2 ]; then
  echo "Github's API returned $STATUSCODE"
  exit 22;
fi