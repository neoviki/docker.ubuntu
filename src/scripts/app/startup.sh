#!/bin/bash

# This docker container run the following commands on startup/bootup

#Your commands

#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
#ENV APACHE_LOCK_DIR /var/lock/apache2
#ENV APACHE_PID_FILE /var/run/apache2.pid

chown www-data:www-data /app_root/app   2>/dev/null 1>/dev/null
chown www-data:www-data /app_root/app/* 2>/dev/null 1>/dev/null
chmod 755 /app_root/app		2>/dev/null 1>/dev/null
chmod 755 /app_root/app/* 	2>/dev/null 1>/dev/null

/bin/bash


