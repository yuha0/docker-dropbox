FROM debian:jessie
MAINTAINER Yuhao Zhang <github@yuha0.com>

RUN apt-get update && apt-get install wget python -y \
 && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
 && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/db \
 && chmod +x /usr/local/db \
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/root/.dropbox", "/root/Dropbox"]

CMD  /.dropbox-dist/dropboxd
