docker ps 1> /dev/null 2>/dev/null

if [ $? -ne 0 ]; then
	echo "[ status ] Installing Docker Engine"
	sudo
	add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" 2> /dev/null 1> /dev/null
	apt-get update -y 2> /dev/null 1> /dev/null
	apt-get install -y docker-ce 2> /dev/null 1> /dev/null
fi

