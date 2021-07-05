FROM ubuntu:18.04
#LABEL maintainer="email address"
LABEL version="0.1"
LABEL description="This is custom Docker Image for Ubuntu"
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /user_scripts
RUN mkdir /user_configs

# Copy all the User Scripts 
COPY scripts/build/install_apt_packages.sh /user_scripts/install_apt_packages.sh
COPY scripts/app/startup.sh /user_scripts/startup.sh 
COPY scripts/build/setup_linux_env.sh /user_scripts/setup_linux_env.sh 

#Copy all user configs
COPY configs/test.conf /user_configs/test.conf

RUN chmod 777 /user_scripts/*

RUN /user_scripts/install_apt_packages.sh
RUN /user_scripts/setup_linux_env.sh

WORKDIR /

ENTRYPOINT ["/bin/bash","/user_scripts/startup.sh"]

# Expose port for applications
EXPOSE 80 443
EXPOSE 5000
