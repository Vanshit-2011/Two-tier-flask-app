#!/bin/bash 

echo " We are starting our deployment process "


cloning_code(){
	echo " Cloning the code "
	git clone https://github.com/Vanshit-2011/Two-tier-flask-app.git
	cd Two-tier-flask-app
}


installing_requirements(){

	echo " Installing the requirements"
	sudo apt-get update 
	sudo apt install docker.io nginx docker-compose
	sudo chown   $USER  /var/run/docker.sock




}

services_restarts(){
	echo " Restarting the services "
	sudo systemctl restart docker
        sudo systemctl enable docker 	
}


building_code(){
	echo " Building the code "
	docker build -t two-tier-flask .
	docker compose up -d
	
}


cloning_code

if ! installing_requirements;then
	echo "Requirements installtion failed"
	exit 1
fi	

if ! services_restarts;then
	echo "System Fault Identified"
	exit 1
fi


if ! building_code;then
	echo "Deployment failed"
	exit 1 
fi 

___________________________________________________Deployment Successful___________________________________________

