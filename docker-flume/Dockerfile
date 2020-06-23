FROM wrong1121/docker:docker-centos-java8

ARG home=/root
ARG software_home=${home}/software
ARG app_home=${home}/app

ENV HOME ${home}
ENV SOFTWARE_HOME ${software_home}
ENV APP_HOME ${app_home}

ARG flume_version=1.9.0
ARG flume_name=flume
ARG flume_home=${app_home}/${flume_name}

ENV FLUME_VERSION ${flume_version}
ENV FLUME_NAME flume
ENV FLUME_HOME ${flume_home}

RUN \
    mkdir -p ${software_home} && \
    mkdir -p ${app_home}

RUN \
    yum install -y wget && \
    wget https://downloads.apache.org/flume/${flume_version}/apache-flume-${flume_version}-bin.tar.gz -P ${software_home}/ && \
    mkdir -p ${flume_home} && \
    tar -zxvf ${software_home}/apache-flume-${flume_version}-bin.tar.gz -C ${flume_home} --strip-components=1

ENV PATH="${FLUME_HOME}/bin:${PATH}"

COPY flume-env.sh ${flume_home}/conf
COPY agent/* ${flume_home}/conf

EXPOSE 44444

ENTRYPOINT ["sh", "-c", "flume-ng agent --name a1 --conf $FLUME_HOME/conf --conf-file $FLUME_HOME/conf/example.conf -Dflume.root.logger=INFO,console"]

