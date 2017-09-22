#!/bin/bash

set -x

#echo "Update configurations"
#sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/" config/server.properties
echo "Current workdir is `pwd`"

echo "Start a zk service"
./bin/zookeeper-server-start ./etc/kafka/zookeeper.properties &

echo "Start a kafka service"
./bin/kafka-server-start ./etc/kafka/server.properties &

echo "Start the scheme registry, optionally to support the Avro data format"
./bin/schema-registry-start ./etc/schema-registry/schema-registry.properties &

sleep 3

echo "Start the RESTful service"
./bin/kafka-rest-start ./etc/kafka-rest/kafka-rest.properties

