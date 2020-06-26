FROM wrong1121/docker:docker-centos-java8

ARG home=/root
ARG software_home=${home}/software
ARG app_home=${home}/app
ARG script_home=${home}/script
ARG log_home=${home}/log

ENV HOME ${home}
ENV SOFTWARE_HOME ${software_home}
ENV APP_HOME ${app_home}
ENV SCRIPT_HOME ${script_home}
ENV LOG_HOME ${log_home}

RUN \
    [ -d ${SOFTWARE_HOME} ] || mkdir -p ${SOFTWARE_HOME} && \
    [ -d ${LOG_HOME} ] || mkdir -p ${LOG_HOME} && \
    [ -d ${SCRIPT_HOME} ] || mkdir -p ${SCRIPT_HOME} && \
    [ -d ${APP_HOME} ] || mkdir -p ${APP_HOME}

ARG kafka_version=2.5.0
ARG scala_version=2.12
ARG kafka_name=kafka
ARG kafka_home=${app_home}/${kafka_name}

ENV KAFKA_VERSION ${kafka_version}
ENV SCALA_VERSION ${scala_version}
ENV KAFKA_NAME ${kafka_name}
ENV KAFKA_HOME ${KAFKA_HOME}

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY script/ ${SCRIPT_HOME}
