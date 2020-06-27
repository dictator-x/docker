#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# test_file=${LOG_HOME}/logger
# touch ${test_file}
AGENT_NAME=$1

# flume-ng agent --name a1 --conf $FLUME_HOME/conf --conf-file $FLUME_HOME/conf/exec-memory-logger.conf -Dflume.root.logger=INFO,console
flume-ng agent --name $AGENT_NAME --conf $FLUME_HOME/conf --conf-file $FLUME_HOME/conf/$AGENT_NAME.conf -Dflume.root.logger=INFO,console

