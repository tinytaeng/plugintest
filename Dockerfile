FROM registry.angstrom.co.th:8443/centos7_nodejs:4.4.5

RUN npm install -g coffee-script@1.10.0 nodemon
COPY package.json /package.json

RUN npm install
