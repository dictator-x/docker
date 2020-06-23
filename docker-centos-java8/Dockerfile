FROM centos:7

RUN \
    yum -y update && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

CMD ["bash"]

