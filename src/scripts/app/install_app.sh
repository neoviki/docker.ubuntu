chmod 777 ./scripts/app/install_docker_engine.sh

source ./app_config.sh
CONTAINER_NAME="${DOCKER_IMAGE_NAME}.dapp"

docker container stop $CONTAINER_NAME 1> /dev/null 2> /dev/null
docker container rm $CONTAINER_NAME 1> /dev/null 2> /dev/null
docker image rm  $DOCKER_IMAGE_NAME 1> /dev/null 2> /dev/null

DOCKER_IMAGE_ARCHIVE="${DOCKER_IMAGE_NAME}.tar"

docker load -i $DOCKER_IMAGE_ARCHIVE

docker create -t -i $EXPOSE_PORTS $MOUNT_SHARES --name $CONTAINER_NAME $DOCKER_IMAGE_NAME
