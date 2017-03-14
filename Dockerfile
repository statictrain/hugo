FROM minhajuddin/golang-1.5.2:1.0.2
MAINTAINER minhajuddink@gmail.com

ENV HUGO_VERSION=0.16

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tgz && \
  tar xvzf hugo_${HUGO_VERSION}_linux-64bit.tgz  && \
  rm -r hugo_${HUGO_VERSION}_linux-64bit.tgz  && \
  mv hugo /usr/bin/hugo

WORKDIR /opt/build

