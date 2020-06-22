FROM centos:7

RUN \
    yum -y update && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all

ENV HOME /root

WORKDIR /root

CMD ["bash"]

