#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

TOPIC=${1:-test}

kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $TOPIC
