# Docker Command Reference [ https://docs.docker.com/engine/reference/builder/ ]
FROM ubuntu:16.04
#LABEL maintainer="your email"

LABEL version="0.1"
LABEL description="This is custom Docker Image for ubunut 16.04"
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update

# Install packages RUN [ execute a command only during build ]
RUN apt-get install -y iputils-ping

#Install ifconfig
RUN apt-get install -y net-tools

# Clean package list to save space
RUN rm -rf /var/lib/apt/lists/* 

# Clean package cache to save space
RUN apt-get clean

#Execute a command [ CMD - Execute a command when ever the docker image is run ]
CMD ["touch", "/test123.txt"]

# Expose port for applications
EXPOSE 22 80 443
