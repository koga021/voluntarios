FROM alpine:3.14
RUN apk update && apk add --update --no-cache python3 postgresql && ln -sf python3 /usr/bin/python

