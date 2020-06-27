#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

TOPIC=${1:-test}
echo "Listen to topic: ${TOPIC}"

kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic ${TOPIC} --from-beginning

