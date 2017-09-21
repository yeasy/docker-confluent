#!/bin/bash

set -x

ZK_HOST=${ZK_HOST:-zookeeper}

echo "List all topics at ${ZK_HOST}"
bin/kafka-topics.sh --list --zookeeper ${ZK_HOST}:2181
