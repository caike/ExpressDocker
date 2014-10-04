# DOCKER-VERSION 1.2.0
FROM  centos:centos6

# Enable EPEL for Node.js
RUN   rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN   yum install -y npm

ADD /src/package.json /tmp/package.json
ADD /src/npm-shrinkwrap.json /tmp/npm-shrinkwrap.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app

WORKDIR /opt/app
ADD /src /opt/app

EXPOSE  8080
CMD ["node", "app.js"]

