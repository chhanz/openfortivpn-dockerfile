# Docker image :`openfortivpn`
> Build for personal use.   

## Build
```bash
$ git clone https://github.com/chhanz/openfortivpn-dockerfile.git
$ cd openfortivpn-dockerfile
$ docker build -t openvpn .
```
   
## RUN
```bash
$ docker run -d -ti --name=openfortivpn-client \
   	     --device=/dev/ppp \
             --net=host --cap-add=NET_ADMIN \
 	     han0495/openvpn:3.0
```
   
## Reference Original Source
[https://github.com/adrienverge/openfortivpn](https://github.com/adrienverge/openfortivpn)
