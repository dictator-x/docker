FROM centos:7

ENV HOME /root

# Basic tools.
RUN \
    yum -y update && \
    yum install -y wget && \
    yum install -y telnet && \
    yum install -y curl && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y jq && \
    yum install -y vim && \
    yum install -y git && \
    yum clean all

# Terminal Tools.
RUN \
    yum install -y zsh && \
    git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh && \
    cp ${HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME}/.zshrc && \
    yum clean all


# Software.
RUN \
    yum -y update && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all

ENV HOME /root
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /root

CMD ["bash"]
