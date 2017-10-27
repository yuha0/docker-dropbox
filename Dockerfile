FROM gcr.io/google_containers/ubuntu-slim:0.14
MAINTAINER Yuhao Zhang <github@yuha0.com>

RUN apt-get update && apt-get install wget python -y \
 && useradd -m dropbox \
 && rm -rf /var/lib/apt/lists/*

USER dropbox

WORKDIR /home/dropbox
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
 && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O dropbox.py \
 && chmod +x dropbox.py

VOLUME /dropbox/Dropbox

CMD  .dropbox-dist/dropboxd
