FROM node:latest

MAINTAINER David Bauer <db@dotcore.net>

RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN npm install -g bower grunt-cli gulp-cli mocha --silent && \
    echo '{ "allow_root": true }' > /root/.bowerrc

WORKDIR /workspace
