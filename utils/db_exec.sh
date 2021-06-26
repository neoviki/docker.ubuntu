IMAGE_NAME="lamp"
DB_COMMAND="SHOW DATABASES;"



# The following commands are for advanced users only

CONTAINER_ID=`docker ps -a | grep $IMAGE_NAME | awk '{print $1}'`
N_CONTAINERS=`docker ps -a | grep $IMAGE_NAME | wc -l`

if [ $N_CONTAINERS -eq 1 ]; then
   #docker exec CONTAINER_ID  mysql -uroot -e "create database DATABASE_NAME" 
   docker exec $CONTAINER_ID  mysql -uroot -e "$DB_COMMAND"
else
	echo "[ error ] more than one container running with the same image ( $IMAGE_NAME )"
fi
