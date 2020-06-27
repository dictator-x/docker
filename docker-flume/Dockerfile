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

ARG flume_version=1.9.0
ARG flume_name=flume
ARG flume_home=${app_home}/${flume_name}

ENV FLUME_VERSION ${flume_version}
ENV FLUME_NAME flume
ENV FLUME_HOME ${flume_home}
ENV PATH=${PATH}:${SCRIPT_HOME}:${FLUME_HOME}/bin

COPY conf/ ${FLUME_HOME}/conf
COPY script/ ${SCRIPT_HOME}

RUN \
    chmod a+x ${SCRIPT_HOME}/*.sh && \
    yum install -y wget && \
    wget https://downloads.apache.org/flume/${FLUME_VERSION}/apache-flume-${FLUME_VERSION}-bin.tar.gz -P ${SOFTWARE_HOME}/ && \
    mkdir -p ${FLUME_HOME} && \
    tar -zxvf ${SOFTWARE_HOME}/apache-flume-${FLUME_VERSION}-bin.tar.gz -C ${FLUME_HOME} --strip-components=1

EXPOSE 44444

ENTRYPOINT ["flume-start.sh"]
CMD ["netcat-memory-logger.conf"]

