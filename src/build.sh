source ./build_config.sh

chmod 777 scripts/build/*
chmod 777 scripts/app/*

CUR_DIR=`pwd`

#Prerequisite

sudo apt-get -y install zip 1>/dev/null  2>/dev/null
rm $DOCKER_IMAGE_PATH/"${DOCKER_IMAGE_NAME}.zip" 1>/dev/null  2>/dev/null
rm -rf $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME 1>/dev/null  2>/dev/null

############### The following section is for advanced users only #################


#docker build - < Dockerfile  -t $DOCKER_IMAGE_NAME
docker build -t $DOCKER_IMAGE_NAME -f Dockerfile .

docker save -o "${DOCKER_IMAGE_NAME}.tar" $DOCKER_IMAGE_NAME
docker image rm  $DOCKER_IMAGE_NAME
mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME
mv "${DOCKER_IMAGE_NAME}.tar" $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/

#Create config.sh	-> Start

echo '# Docker Container Configuration' > app_config.sh
echo ''					>> app_config.sh
echo "DOCKER_IMAGE_NAME="$DOCKER_IMAGE_NAME""	>> app_config.sh
echo 'MOUNT_SHARES="-v ${PWD}/app_root/app:/app_root/app -v ${PWD}/app_root/db:/app_root/db -v ${PWD}/app_root/startup:/app_root/startup"' >> app_config.sh
echo '#EXPOSE_PORTS=""' >> app_config.sh
echo '#EXPOSE_PORTS="-p 80:80"' >> app_config.sh
echo 'EXPOSE_PORTS="-p 5000:80"' >> app_config.sh
echo ''	>> app_config.sh

chmod 777 app_config.sh

mv app_config.sh  $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/

#Create config.sh	-> End

#Create app	-> Start

mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/app
mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/db
mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/configs
mkdir -p $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/startup

#Create app	-> End

cp configs/* $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/configs/
cp scripts/app/startup.sh $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/app_root/startup/

cp scripts/app/install_app.sh $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/
cp scripts/app/run_app.sh $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/
cp scripts/app/run_app_interactive.sh $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/
cp -arf scripts $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/
chmod 777 $DOCKER_IMAGE_PATH/$DOCKER_IMAGE_NAME/scripts/*

cd $DOCKER_IMAGE_PATH/

zip -r "${DOCKER_IMAGE_NAME}.zip" ${DOCKER_IMAGE_NAME}

rm -rf ${DOCKER_IMAGE_NAME} 1>/dev/null  2>/dev/null

cd $CUR_DIR
