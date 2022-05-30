#!/usr/bin/env bash

# *-* coding:utf-8 *-*



function sxd_installing() {
	local comp=$USER
	local bypass=$(whoami)
	if [  -e /usr/bin/docker ]; then
		echo  -e  '\033[1;22;44m sussesfully installing process \033[0m'
		exit
		
	else

		if [ $comp == root ]; then
			pacman -Sy docker httpd
			if command docker ; then
				echo "[-] installing ... \n" && sleep 0.5
				docker run  hello-world
			else 
				systemctl enable docker.service
				systemctl start docker.service
				groupadd docker 

				# config run user single  not root not sudo 
				gpasswd -a $USER docker
				systemctl stop docker.service 

				systemctl start docker.service 
				
				# logaut logaut  is necesary 


				# kill -9 -1 <---- command 
				return  docker run hello-world 
				exit

				
			fi
		else
			if [ $bypass == $comp ]; then
				echo "please run user sudo... \n  " && sleep 0.5
				if [ -a /usr/bin/docker ]; then
					sudo systemctl enable docker.service 
					sudo systemctl stop docker.service
					sudo systemctl start docker.service
					sudo docker run hello-world
					groupadd docker
					gpasswd -a $USER docker 
					# logout session  is current  service
					
					# kill -9 -1
					
				fi		
				
			fi 
		fi				
		# echo -e '\033[1;48;36m optionall sussesfully command \033[0m'
		#exit
		
	fi
	
}


sxd_installing 
