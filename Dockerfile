FROM stackbrew/debian:jessie
MAINTAINER Pierre Ozoux <pierre@ozoux.net>

# Install haproxy
RUN apt-get update
RUN apt-get install -y haproxy

ENV RUNDIR /run/haproxy

# Install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ADD start.sh /start.sh

# add confd config
ADD haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl
ADD haproxy.toml /etc/confd/conf.d/haproxy.toml
ADD crt-list.tmpl /etc/confd/templates/crt-list.tmpl
ADD crt-list.toml /etc/confd/conf.d/crt-list.toml

VOLUME /etc/confd

CMD ["/bin/bash","/start.sh"]
