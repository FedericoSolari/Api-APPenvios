#!/bin/sh

TARGET_URL=$1
VERSION=$2

i="0"

while [ $i -lt 3 ]
do
  echo "Smoke test"
  curl -k $TARGET_URL | grep $VERSION
  if [ "$?" = "0" ];
  then
  	echo "Test:OK"
  	exit 0
  fi
  i=$(( $i+1 ))
  sleep 45
done

echo "Test:FAIL"
exit 1
