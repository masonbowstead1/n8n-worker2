FROM n8nio/n8n:2.1.3

USER root

RUN apk update && apk add --no-cache ffmpeg

USER node
