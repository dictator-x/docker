FROM wrong1121/docker:docker-centos-java8

ENV APACHE_FLUME_VERSION 1.9.0
ENV APACHE_FLUME_NAME flume
ENV SOFTWARE_HOME ${HOME}/software
ENV APP_HOME ${HOME}/app
ENV FLUME_HOME ${APP_HOME}/${APACHE_FLUME_NAME}

RUN \
    mkdir -p ${SOFTWARE_HOME} && \
    mkdir -p ${APP_HOME}

RUN \
    yum install -y wget && \
    wget https://downloads.apache.org/flume/${APACHE_FLUME_VERSION}/apache-flume-${APACHE_FLUME_VERSION}-bin.tar.gz -P ${SOFTWARE_HOME}/ && \
    mkdir -p ${FLUME_HOME} && \
    tar -zxvf ${SOFTWARE_HOME}/apache-flume-${APACHE_FLUME_VERSION}-bin.tar.gz -C ${FLUME_HOME} --strip-components=1

ENV PATH="${FLUME_HOME}/bin:${PATH}"

COPY flume-env.sh ${FLUME_HOME}/conf
COPY agent/* ${FLUME_HOME}/conf


ENTRYPOINT ["sh", "-c", "flume-ng agent --name a1 --conf $FLUME_HOME/conf --conf-file $FLUME_HOME/conf/example.conf -Dflume.root.logger=INFO,console"]

EXPOSE 44444
