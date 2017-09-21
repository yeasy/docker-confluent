#!/bin/bash

set -x

KAFKA_HOST=${KAFKA_HOST:-localhost}
TOPIC_NAME=${1:-test}

echo "Send msg to topic ${TOPIC_NAME} by connecting to ${KAFKA_HOST}"
./bin/kafka-avro-console-consumer --topic ${TOPIC_NAME} \
    --zookeeper ${KAFKA_HOST}:2181 \
    --from-beginning
