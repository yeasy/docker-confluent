#!/bin/bash

set -x

KAFKA_HOST=${KAFKA_HOST:-localhost}
TOPIC_NAME=${1:-test}

echo "Send msg to topic ${TOPIC_NAME} by connecting to ${KAFKA_HOST}, input like '{\"f1\": \"value1\"}'"
./bin/kafka-avro-console-producer \
    --broker-list ${KAFKA_HOST}:9092 --topic ${TOPIC_NAME} \
    --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'
