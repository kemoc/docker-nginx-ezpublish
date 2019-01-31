FROM nginx:1.14
MAINTAINER Radek Z

ENV PROJECTMAPPINGFOLDER="/var/www/project"

# Update sources
RUN apt update -y

RUN apt install -y apt-utils

# Install Midnight Commander, Vim, Nano
RUN apt install -y vim nano wget

# Install libssl
RUN apt install -y libssl-dev

RUN apt install -y curl libcurl4-openssl-dev

RUN apt install -y bash

# Setup timezone
#RUN TZ=Europe/Warsaw
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak

WORKDIR /etc/nginx/

RUN rm -rf /tmp/*

COPY entrypoint.bash /entrypoint.bash
RUN chmod a+x /entrypoint.bash
ENTRYPOINT ["/entrypoint.bash"]

#CMD ["nginx", "-g", "'daemon off;'"]
