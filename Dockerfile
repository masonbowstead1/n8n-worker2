# -------- Stage 1: download static ffmpeg --------
FROM alpine:3.20 AS ffmpeg

RUN apk add --no-cache curl tar xz
WORKDIR /tmp

RUN curl -L -o ffmpeg.tar.xz https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
  && tar -xJf ffmpeg.tar.xz \
  && mv ffmpeg-*-amd64-static ffmpeg

# -------- Stage 2: n8n worker --------
FROM n8nio/n8n:2.1.3

USER root

COPY --from=ffmpeg /tmp/ffmpeg/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /tmp/ffmpeg/ffprobe /usr/local/bin/ffprobe

RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

USER node

CMD ["n8n", "worker"]
