# Container image that runs your code
FROM ubuntu:18.04
USER root
RUN apt-get update && apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get upgrade -y && apt-get install nodejs -y
#RUN apk add --no-cache --upgrade bash
#RUN apk add -update --no-cache git openssh ca-certificates openssl jq gettext xmlstarlet curl

RUN npm install sfdx-cli --global
RUN sfdx --version
RUN sfdx plugins --core
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

#CMD chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
#CMD ["sh", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
