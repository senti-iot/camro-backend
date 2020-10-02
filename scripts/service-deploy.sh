#!/bin/bash

if [[ "$1" == "master" ]]; then 
	echo
	echo Deploying camro-backend $1 ... 
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/services/camro-backend/production
	echo
	echo Restarting camro-backend service: $1 ... 
	ssh deploy@rey.webhouse.net 'sudo /srv/nodejs/senti/services/camro-backend/production/scripts/service-restart.sh master'
	echo
	echo Deployment to camro-backend $1 and restart done!
	exit 0
fi 

if [[ "$1" == "dev" ]]; then 
	echo
	echo Deploying camro-backend $1 ... 
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/services/camro-backend/development
	echo
	echo Restarting camro-backend service: $1 ... 
	ssh deploy@rey.webhouse.net 'sudo /srv/nodejs/senti/services/camro-backend/development/scripts/service-restart.sh dev'
	echo
	echo Deployment to camro-backend $1 and restart done!
	exit 0
fi