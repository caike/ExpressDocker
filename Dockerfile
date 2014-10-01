# DOCKER-VERSION 1.2.0
FROM  centos:centos6

# Enable EPEL for Node.js
RUN   rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN   yum install -y npm

# Creates a new folder on the container
VOLUME /src
# Copies everything from
# the host /src to the container's /src
ADD /src /src

# Installs dependencies
RUN cd /src; npm install

EXPOSE  8080
CMD ["node", "/src/app.js"]

