#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/${KAFKA_VERSION}/${KAFKA_FILE}&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')

if [[ ! $(curl -s -f -I "${url}") ]]; then
    echo "Mirror does not have desired version, downloading direct from Apache"
    url="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_FILE}"
fi

echo "Downloading Kafka from $url"
wget "${url}" -O "${SOFTWARE_HOME}/${KAFKA_FILE}"
