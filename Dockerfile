FROM n8nio/n8n:2.1.3

USER root
RUN apk add --no-cache ffmpeg

USER node
RUN npm install --omit=dev n8n-nodes-upload-post

CMD ["n8n", "worker"]
