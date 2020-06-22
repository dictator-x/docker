FROM wrong1121/docker:docker-centos-java8

ENV APACHE_FLUME_VERSION 1.9.0
ENV APACHE_FLUME_NAME flume
ENV SOFTWARE_HOME ${HOME}/software
ENV APP_HOME ${HOME}/app

RUN \
    mkdir -p ${SOFTWARE_HOME} && \
    mkdir -p ${APP_HOME}

RUN \
    yum install -y wget && \
    wget https://downloads.apache.org/flume/${APACHE_FLUME_VERSION}/apache-flume-${APACHE_FLUME_VERSION}-bin.tar.gz -P ${SOFTWARE_HOME}/ && \
    mkdir -p ${APP_HOME}/${APACHE_FLUME_NAME} && \
    tar -zxvf ${SOFTWARE_HOME}/apache-flume-${APACHE_FLUME_VERSION}-bin.tar.gz -C ${APP_HOME}/${APACHE_FLUME_NAME} --strip-components=1

