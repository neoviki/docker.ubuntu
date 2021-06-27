## Docker UBUNTU App

  This repo contains essential scripts to spawn a Docker Ubuntu server

#### Compile Docker LAMP App

  - src/build.sh

#### Run Docker Ubuntu App [ You need to build before doing this procedure ]

  - cd bin
  - unzip ubuntu16.04.zip
  - cd ubuntu16.04
  - ./run.sh

#### Startup Script [ You need to build before doing this procedure ]

 You can customise the startup script. The startup script is located at, 

	- bin/ubuntu16.04/app/startup.sh 

#### Quick Run

	wget https://github.com/vikiworks-io/docker_ubuntu/blob/master/archive/ubuntu.tar.gz?raw=true -O ubuntu.tar.gz; mkdir ubuntu; mv ubuntu.tar.gz ubuntu/; cd ubuntu; tar -zxvf ubuntu.tar.gz; cd ubuntu; ./build.sh;cd ../bin/; unzip ubuntu16.04.zip; cd ubuntu16.04; ./run.sh


