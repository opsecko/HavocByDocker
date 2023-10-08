#!/bin/bash

if [ "$1" = "start" ]; then
    echo "Starting service"
    sudo docker run --name my_havoc_teamserver -p 40056:40056 -p 443:443 -it -d -v havoc-c2-server-volume:/data havoc-teamserver 
    #sudo docker run --name my_havoc_teamserver -p 40056:40056 -p 443:443 -it -v /etc/localtime:/etc/localtime -d havoc-teamserver 
    sudo docker exec -it my_havoc_teamserver /go/Havoc/teamserver/havoc  server --profile /data/demo.yaotl
    #sudo docker exec -it my_havoc_teamserver  bash
elif [ "$1" = "stop" ]; then
    echo "Stopping service"
    sudo docker stop my_havoc_teamserver
    sudo docker rm my_havoc_teamserver
else
    echo "Unknown command: $1"
    echo "./sh start or stop"
fi