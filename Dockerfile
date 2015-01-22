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

# install chef
#RUN apt-get -y update && \
#    apt-get -y install curl supervisor &&\
#    apt-get clean &&\
#    curl -L https://getchef.com/chef/install.sh | bash -s -- -v latest -p -P chef
#    #curl -L https://getchef.com/chef/install.sh | bash -s -- -v latest -P chefdk

#RUN apt-get -y install rbenv bundler autoconf

# prepare chef config
#COPY files/default/etc/chef/client-docker.rb /etc/chef/client.rb

# prepare ~/.gemrc
#COPY files/default/gemrc /root/.gemrc

# copy this cookbook onto the machine
#COPY ./ /usr/local/cookbooks/d4b6-base/

# go into the copy of this cookbook
#WORKDIR /usr/local/cookbooks/d4b6-base

# use bundler to install dependencies
#RUN bundle install --path vendor/bundle --binstubs /usr/local/bin --jobs 4 --without development test

# use berks (provided vi chefdk) to vendor all required cookbooks
#RUN mkdir -p /var/chef/cookbooks
#RUN berks vendor /var/chef/cookbooks
# we dont use -z option as we have a /etc/chef/client.rb in place that has local_mode true
# for some reason -z and local_mode true behave pretty much different
#RUN chef-client -l info -r d4b6-base::git
#ADD . /chef

#RUN cd /chef && /opt/chef/embedded/bin/berks install --path /chef/cookbooks
#RUN chef-solo -c /chef/solo.rb -j /chef/solo.json
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["/bin/bash"]
