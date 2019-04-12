# DOCKER-VERSION 1.0.0
FROM debian:jessie
MAINTAINER Peter Niederlag "peter.niederlag@datenbetrieb.de"

# injecting some packages into the base debian image
# - vim [~30 MB]
#     one of the things that have rocked linux since the beginning
# - curl [~20 MB]
#     very useful during deployment operations
# - nettools [~1MB]
#     helps in diagnosing network related stuff and has very small footprint
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y update && \
    apt-get -y install vim && \
    apt-get -y install curl && \
    apt-get -y install net-tools && \
    apt-get -y install locales && \
    apt-get clean && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

# set /bin/bash as default command
CMD ["/bin/bash"]
