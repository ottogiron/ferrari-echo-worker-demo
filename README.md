#  Echo Worker Demo with Ferrariwoker Rabbit Processor and Docker

Uses [Ferarriworker](https://github.com/ottogiron/ferrariworker) and a node  [Echo server](https://www.npmjs.com/package/echo-server) to create a simple worker. 

## Prerrequisites

* [Echo server](https://www.npmjs.com/package/echo-server) 
* RabbitMQ

You have to send some messages to the queue

## Build the image 

```
docker build -t ferrari-echo .
```

Run

```
docker run --rm -e ECHO_SERVER_URL=192.168.1.8 -e QUEUE_HOST=192.168.1.8  -e QUEUE_NAME=hello  -it ferrari-echo
```

