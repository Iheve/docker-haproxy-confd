FROM stackbrew/debian:jessie
MAINTAINER Nicole Hubbard <code@nicolehubbard.net>

# Install haproxy
RUN apt-get update
RUN apt-get install -y haproxy

ENV RUNDIR /run/haproxy

# Install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.6.0/confd-0.6.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ADD start.sh /start.sh

# add confd config
ADD haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl
ADD haproxy.toml /etc/confd/conf.d/haproxy.toml

VOLUME /etc/confd

CMD ["/bin/bash","/start.sh"]
