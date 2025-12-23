FROM n8nio/n8n:2.1.3

USER root

RUN apt-get update \
 && apt-get install -y ffmpeg \
 && rm -rf /var/lib/apt/lists/*

USER node

CMD ["n8n", "worker"]
