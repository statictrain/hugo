FROM alpine:latest
MAINTAINER Static Train <statictrain@cosmicvent.com>

# this is for when we need to force a refresh
ENV REFRESHED_AT 2017-03-19
ENV IMAGE statictrain/hugo
ENV HUGO_VERSION 0.19
ENV HUGO_URL https://github.com/spf13/hugo/releases/download/v0.19/hugo_0.19_Linux-64bit.tar.gz

RUN apk add \
  --update \
  --no-progress \
  --no-cache \
  py-pip \
  wget \
  ca-certificates \
  git \
  && \
  wget "$HUGO_URL" \
  && \
  mkdir -p /usr/local/hugo \
  && \
  tar xzf "$(basename "$HUGO_URL")" -C /usr/local/hugo \
  && \
  rm "$(basename "$HUGO_URL")" \
  && \
  ln -s /usr/local/hugo/*/hugo* /usr/local/bin/hugo \
  && \
  apk del wget \
  && \
  pip install --upgrade pip \
  && \
  pip install pygments \
  && \
  rm /var/cache/apk/*

VOLUME /build
WORKDIR /build

