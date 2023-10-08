Installer by docker using tsinghua source 

### how to use

1. git clone xxx

2. run this line 

```
docker volume create havoc-c2-server-volume
docker build -t havoc-teamserver -f Teamserver-Dockerfile .
docker volume create havoc-c2-client-volume
docker build -t havoc-client -f Client-Dockerfile .
```
