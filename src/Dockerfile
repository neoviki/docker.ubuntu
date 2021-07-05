FROM ubuntu:18.04
#LABEL maintainer="email address"
LABEL version="0.1"
LABEL description="This is custom Docker Image for Ubuntu"
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /user_scripts

# Copy all the User Scripts 
COPY scripts/build/install_apt_packages.sh /user_scripts/install_apt_packages.sh
COPY scripts/build/setup_linux_env.sh /user_scripts/setup_linux_env.sh 

RUN chmod 777 /user_scripts/*

RUN /user_scripts/install_apt_packages.sh
RUN /user_scripts/setup_linux_env.sh

WORKDIR /

ENTRYPOINT ["/bin/bash","/app_root/startup/startup.sh"]

# Expose port for applications
EXPOSE 80 443
EXPOSE 5000
