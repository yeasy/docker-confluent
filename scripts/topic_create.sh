#!/bin/bash

set -x

ZK_HOST=${ZK_HOST:-zookeeper}
TOPIC_NAME=${1:-test}

echo "Create a topic ${TOPIC_NAME} by connecting to ${ZK_HOST}"

bin/kafka-topics.sh --create --zookeeper ${ZK_HOST}:2181 --replication-factor 1 --partitions 1 --topic ${TOPIC_NAME}
