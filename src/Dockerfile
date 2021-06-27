# Docker Command Reference [ https://docs.docker.com/engine/reference/builder/ ]
FROM ubuntu:16.04
#LABEL maintainer="email address"
LABEL version="0.1"
LABEL description="This is custom Docker Image for ubunut 18.04"
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update

# Install packages RUN [ execute a command only during build ]
RUN apt-get install -y iputils-ping

#Install ifconfig
RUN apt-get install -y net-tools

RUN apt-get update

RUN apt-get install -y openssh-server

# Clean package list to save space
RUN rm -rf /var/lib/apt/lists/* 

# Clean package cache to save space
RUN apt-get clean

#/etc/ssh/sshd_config

WORKDIR /

ENTRYPOINT ["/bin/bash","/app/startup.sh"]

# Expose port for applications
#EXPOSE 80 443
