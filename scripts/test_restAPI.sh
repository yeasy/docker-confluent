#!/bin/bash
# Test json messages
# https://docs.confluent.io/3.2.1/kafka-rest/docs/intro.html#quickstart

#echo "Update configurations"
#sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/" config/server.properties
echo "Current workdir is `pwd`"

echo "Produce a message using JSON with the value '{ foo: bar }' to the topic jsontest"
curl -X POST -H "Content-Type: application/vnd.kafka.json.v2+json" \
    -H "Accept: application/vnd.kafka.v2+json" \
    --data '{"records":[{"value":{"foo":"bar"}}]}' \
    "http://localhost:8082/topics/jsontest"
# {"offsets":[{"partition":0,"offset":0,"error_code":null,"error":null}],"key_schema_id":null,"value_schema_id":null}

sleep 1

echo -e "\nCreate a consumer for JSON data, starting at the beginning of the topic's log"
curl -X POST -H "Content-Type: application/vnd.kafka.v2+json" \
    --data '{"name": "my_consumer_instance", "format": "json", "auto.offset.reset": "earliest"}' \
    http://localhost:8082/consumers/my_json_consumer
# {"instance_id":"my_consumer_instance", "base_uri":"http://localhost:8082/consumers/my_json_consumer/instances/my_consumer_instance"}

echo -e "\nSubscribe consumer to a topic"
curl -X POST -H "Content-Type: application/vnd.kafka.v2+json" \
    --data '{"topics":["jsontest"]}' \
    http://localhost:8082/consumers/my_json_consumer/instances/my_consumer_instance/subscription

echo -e "\nGet records of topic"
curl -X GET -H "Accept: application/vnd.kafka.json.v2+json" \
    http://localhost:8082/consumers/my_json_consumer/instances/my_consumer_instance/records
# [{"key":null,"value":{"foo":"bar"},"partition":0,"offset":0,"topic":"jsontest"}]

echo -e "\nClose the consumer with a DELETE to make it leave the group and clean up its resources"
curl -X DELETE -H "Content-Type: application/vnd.kafka.v2+json" \
    http://localhost:8082/consumers/my_json_consumer/instances/my_consumer_instance
