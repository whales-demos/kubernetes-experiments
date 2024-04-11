#!/bin/bash
docker build --platform=linux/amd64 -t tiny-service:0.0.3 . 

docker images | grep tiny-service