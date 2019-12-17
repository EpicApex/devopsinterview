#Requiered - FROM - docker base image name
FROM node:latest

#Optional - MAINTAINER - specify maintainer details
MAINTAINER Omri Freidenberg omrifreidenberg@gmail.com

#Optional - USER - set user to root for permissions sake
USER root

#Creating new folder for the app management
RUN mkdir -p /usr/src/app

#WOKRDIR - set workdir on app created folder
WORKDIR /usr/src/app

# Dependencies wont have to be installed again by Docker, if you have changed the package.json file
#Copy dependencies (package.json) to app 
COPY package.json /usr/src/app/
#installing npm
RUN npm install
#Copy everything to app folder
COPY . /usr/src/app

#EXPOSE a port which the container will listen on.
EXPOSE 3000

#CMD - provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
CMD ["npm","start"]

#CMD ["echo","DevOps Exercise - Omri Freidenberg - Image was built using Dockerfile - /devopsinterview"]