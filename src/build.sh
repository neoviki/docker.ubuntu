source ./config.sh
CUR_DIR=`pwd`

#Prerequisite

sudo apt-get -y install zip
rm $DOCKER_IMAGE_PATH/"${DOCKER_IMAGE_NAME}.zip"
rm -rf $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME

############### The following section is for advanced users only #################


#docker build - < Dockerfile  -t $DOCKER_IMAGE_NAME
docker build -t $DOCKER_IMAGE_NAME -f Dockerfile .

docker save -o "${DOCKER_IMAGE_NAME}.tar" $DOCKER_IMAGE_NAME
docker image rm  $DOCKER_IMAGE_NAME
mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME
mv "${DOCKER_IMAGE_NAME}.tar" $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/

#Create config.sh	-> Start
echo '# Docker Container Configuration'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo "DOCKER_IMAGE_NAME="$DOCKER_IMAGE_NAME""	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'MOUNT_SHARES="-v ${PWD}/app:/app"' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo '#EXPOSE_PORTS="-p 80:80"' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'EXPOSE_PORTS=""' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -d ${PWD}/app/db ]; then'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'mkdir -p ${PWD}/app/db' 		>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' 				>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -d ${PWD}/app/data ]; then'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'mkdir -p ${PWD}/app/data' 		>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' 				>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -d ${PWD}/app/data/code ]; then'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'mkdir -p ${PWD}/app/data/code' 		>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' 				>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -d ${PWD}/app/data/bin ]; then'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'mkdir -p ${PWD}/app/data/bin' 		>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' 				>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -d ${PWD}/app/data/media ]; then'	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'mkdir -p ${PWD}/app/data/media' 		>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' 				>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh

#if
echo 'if [ ! -f "${PWD}/app/startup.sh" ]; then' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'echo "#!/bin/bash" >  ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'echo "# This docker container run the following commands on startup/bootup" >> ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo '' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'echo "ls" >>  ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo '' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo '' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo '' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'echo "# Remove the following line to run this docker in non-interactive mode" >> ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo '' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'echo "/bin/bash" >>  ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
	echo 'chmod 777 ${PWD}/app/startup.sh' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
echo 'fi' >> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#fi
echo ''	>> $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh


chmod 777  $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/config.sh
#Create config.sh	-> End

#Create run.sh	-> Start
echo 'source ./config.sh' 				>> ./run.sh
echo 'CONTAINER_NAME="${DOCKER_IMAGE_NAME}.dapp"'	>> ./run.sh

echo 'docker container rm $CONTAINER_NAME &> /dev/null'	>> ./run.sh
echo 'docker image rm  $DOCKER_IMAGE_NAME &> /dev/null'	>> ./run.sh

echo 'DOCKER_IMAGE_ARCHIVE="${DOCKER_IMAGE_NAME}.tar"'	>> ./run.sh
echo 'docker load -i $DOCKER_IMAGE_ARCHIVE'		>> ./run.sh

echo '' >> ./run.sh
echo 'docker create -t -i $EXPOSE_PORTS $MOUNT_SHARES --name $CONTAINER_NAME $DOCKER_IMAGE_NAME'	>> ./run.sh
echo '' >> ./run.sh
echo ''	>> ./run.sh
echo 'docker start -ai $CONTAINER_NAME'	>> ./run.sh
echo ''	>> ./run.sh
echo ''	>> ./run.sh
#Create run.sh -> End

chmod 777 run.sh
mv run.sh $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/

cd $DOCKER_IMAGE_PATH/

zip -r "${DOCKER_IMAGE_NAME}.zip" ${DOCKER_IMAGE_NAME}

rm -rf ${DOCKER_IMAGE_NAME}

cd $CUR_DIR
