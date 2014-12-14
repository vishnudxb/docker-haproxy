FROM ubuntu:14.04
 
MAINTAINER Vishnu Nair "vishnu.nair66@gmail.com"

RUN apt-get update && \
    apt-get install -y haproxy && \
    rm -rf /var/lib/apt/lists/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

RUN echo 'EXTRAOPTS="-db"' >> /etc/default/haproxy

EXPOSE 80 443

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-p", "-/var/run/haproxy.pid"]
