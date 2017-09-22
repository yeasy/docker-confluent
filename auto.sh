#!/bin/bash

CONTAINER_NAME=confluent

echo "Start confluent, with RESTful API listen on port 8082"
docker run \
    --name ${CONTAINER_NAME} \
    -it \
    -d \
    -p 8082:8082 \
    yeasy/confluent:latest

echo "Test RESTful APIs"
docker exec -it ${CONTAINER_NAME}bash /tmp/test_restAPI.sh

echo "Stop confluent"
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
