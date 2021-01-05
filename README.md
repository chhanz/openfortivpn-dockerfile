# Container image : [`openfortivpn`](https://quay.io/repository/chhanz/openvpn)   
> Build for personal use.   

## Build
```bash
$ git clone https://github.com/chhanz/openfortivpn-dockerfile.git
$ cd openfortivpn-dockerfile
$ podman build -t openvpn .
```
   
## RUN
```bash
$ podman run -d -ti --name=openfortivpn-client \
   	     --device=/dev/ppp \
             --net=host --cap-add=NET_ADMIN \
             -v startvpn.sh:/script/startvpn.sh \
 	     quay.io/chhanz/openvpn:4.0
```
   
## SCRIPT
```bash
#!/bin/bash
# This script is example for build.

openfortivpn <VPN Address> [--insecure-ssl] --username="USERID" --password="PASSWD" [--set-routes=0]

echo "Please modify script!!"
```
    
## Reference Original Source
[https://github.com/adrienverge/openfortivpn](https://github.com/adrienverge/openfortivpn)

## Changelog
1. Changed 'container runtime PODMAN'
2. Changed 'base image version' : ubuntu 18.04 to 20.04
3. Changed 'Added script for start vpn'
