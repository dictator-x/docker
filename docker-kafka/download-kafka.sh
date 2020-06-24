#!/bin/sh -e

if [[ -z $1 && -z $SCALA_VERSION ]]; then
  echo "ERROR: missing SCALA_VERSION"
  exit 1
fi

if [[ -z $2 && -z $KAFKA_VERSION ]]; then
  echo "ERROR: missing KAFKA_VERSION"
  exit 1
fi

SCALA_VERSION=$1
KAFKA_VERSION=$2

FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/${KAFKA_VERSION}/${FILENAME}&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')

if [[ ! $(curl -s -f -I "${url}") ]]; then
    echo "Mirror does not have desired version, downloading direct from Apache"
    url="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${FILENAME}"
fi

echo "Downloading Kafka from $url"
wget "${url}" -O "/tmp/${FILENAME}"
