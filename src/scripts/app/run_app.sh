source ./app_config.sh
CONTAINER_NAME="${DOCKER_IMAGE_NAME}.dapp"

docker container stop $CONTAINER_NAME 1> /dev/null 2> /dev/null

#Interactive Mode
docker start -ai $CONTAINER_NAME

#Non interactive Mode
#docker start $CONTAINER_NAME


