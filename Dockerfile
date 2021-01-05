FROM ubuntu:20.04
MAINTAINER chhanz <han0495@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive 

# Run upgrades and install recommend package
RUN apt-get update\
 && apt install -y git gcc automake autoconf libssl-dev make pkg-config ppp\
 && apt-get clean

# Install openfortivpn
RUN cd /tmp\
 && git clone https://github.com/adrienverge/openfortivpn.git\
 && cd openfortivpn/\
 && ./autogen.sh\
 &&./configure --prefix=/usr/local --sysconfdir=/etc\
 && make\
 && make install\
 && rm -rf /tmp/* \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /script 

ADD startvpn.sh /script

ENTRYPOINT ["/bin/bash", "/script/startvpn.sh"]
