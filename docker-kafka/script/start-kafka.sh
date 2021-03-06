#!/usr/bin/env bash

set -o errexit
# set -o nounset
set -o pipefail

function downloadAndRunZookeeper() {
    echo "Download Zookeeper" >&2

    ZK_VERSION=3.4.14
    ZK_FILENAME="zookeeper-${ZK_VERSION}"
    ZK_NAME=zookeeper
    ZK_HOME=${APP_HOME}/${ZK_NAME}

    wget -q "https://mirror.dsrg.utoronto.ca/apache/zookeeper/zookeeper-${ZK_VERSION}/${ZK_FILENAME}.tar.gz" -O "${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz"
    wget -q https://www.apache.org/dist/zookeeper/KEYS -O "${SOFTWARE_HOME}/KEYS"
    wget -q https://www.apache.org/dist/zookeeper/${ZK_FILENAME}/${ZK_FILENAME}.tar.gz.asc -O "${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz.asc"
    wget -q https://www.apache.org/dist/zookeeper/${ZK_FILENAME}/${ZK_FILENAME}.tar.gz.sha256 -O "${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz.sha256"

    cd ${SOFTWARE_HOME}
    sha256sum -c "${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz.sha256"
    cd -
    gpg --import ${SOFTWARE_HOME}/KEYS
    gpg --verify ${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz.asc

    mkdir -p ${ZK_HOME}
    tar -zxf ${SOFTWARE_HOME}/${ZK_FILENAME}.tar.gz -C ${ZK_HOME} --strip-components=1

    mv ${ZK_HOME}/conf/zoo_sample.cfg ${ZK_HOME}/conf/zoo.cfg
    # ${ZK_HOME}/bin/zkServer.sh start-foreground
    ${ZK_HOME}/bin/zkServer.sh start

    local i=0
    local spin='-\|/'
    while ! nc -z localhost 2181 </dev/null; do
        i=$(( (i+1) %4 ))
        # printf "\r[${spin:$i:1}]"
        printf "\rWaiting ZOOKEEPER start...[${spin:$i:1}]"
        sleep .1;
    done

}

if [[ -z $KAFKA_ZK_CONNECTION || $KAFKA_ZK_CONNECTION =~ "localhost" ]]; then
    downloadAndRunZookeeper
fi

kafka-server-start.sh ${KAFKA_HOME}/config/server.properties
