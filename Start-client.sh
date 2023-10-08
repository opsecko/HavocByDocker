#!/bin/bash

if [ "$1" = "start" ]; then
    echo "Starting service"
    sudo xhost +"local:docker@"
    sudo docker  run --name my_havoc_client -t -d --net=host -e DISPLAY=$DISPLAY  -v havoc-c2-client-volume:/data havoc-client
    sudo docker exec my_havoc_client "/Havoc/client/Havoc"
elif [ "$1" = "stop" ]; then
    echo "Stopping service"
    sudo docker stop my_havoc_client
    sudo docker rm my_havoc_client
else
    echo "Unknown command: $1"
    echo "./sh start or stop"
fi