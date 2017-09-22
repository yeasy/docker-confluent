#!/bin/bash

CONTAINER_NAME=confluent

docker rm -f ${CONTAINER_NAME}

echo "Start confluent, with RESTful API listen on port 8082"
docker run \
    --name ${CONTAINER_NAME} \
    -it \
    -d \
    -p 8082:8082 \
    yeasy/confluent:latest

echo "Test RESTful APIs"
docker exec -it ${CONTAINER_NAME} /tmp/test_restAPI.sh

echo "Stop and remove confluent"
docker rm -f ${CONTAINER_NAME}
