#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

TOPIC=${1:-test}
echo "Send to topic: ${TOPIC}"
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic $TOPIC
