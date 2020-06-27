#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

kafka-topics.sh --list --bootstrap-server localhost:9092
