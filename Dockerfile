# Container image that runs your code
FROM alpine:3.7
RUN apk add --no-cache --upgrade bash
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

CMD chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["sh", "/entrypoint.sh"]
