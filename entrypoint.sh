#!/bin/sh

#Get configuration variables from zookeeper or any configuration provider?

ferrariworker process rabbit \
    --uri="amqp://guest:guest@$RABBIT_HOST"\
    --queue-name=$QUEUE_NAME \
    --consumer-auto-ack=true \
    --command="node echo.js" \
    --command-run-path="/app" \
    --exchange="text-exchange" \
    --max-concurrency=8     