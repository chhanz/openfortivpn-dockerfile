FROM ubuntu:18.04
MAINTAINER chhanz <han0495@gmail.com>

# Run upgrades and install recommend package
RUN apt-get update\
 && apt install -y git gcc automake autoconf libssl-dev make pkg-config ppp iputils-ping tmux openssh-server

# Install openfortivpn
RUN cd /tmp\
 && git clone https://github.com/adrienverge/openfortivpn.git\
 && cd openfortivpn/\
 && ./autogen.sh\
 &&./configure --prefix=/usr/local --sysconfdir=/etc\
 && make\
 && make install\
 && echo "Remove cache" \
 && rm -rf /tmp/* \
 && rm -rf /var/lib/apt/lists/* \
 && sed 's/#GatewayPorts no/GatewayPorts yes/g' -i /etc/ssh/sshd_config \
 && sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' -i /etc/ssh/sshd_config \
 && sed 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' -i /etc/ssh/sshd_config 

ENTRYPOINT ["/bin/bash"]
