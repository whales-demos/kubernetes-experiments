#!/bin/bash

: <<'END_COMMENT'
Docker Buildx is an advanced feature provided by Docker that allows you 
to build Docker images for multiple platforms (like AMD64, ARM64, etc.) from a single command. 
It's essentially an extension to the Docker CLI that introduces the ability to 
build, tag, and push images using the BuildKit engine, which provides improved performance, caching, and build capabilities compared to the traditional Docker build process.
END_COMMENT

docker buildx build \
--platform=linux/amd64,linux/arm64 \
--build-arg="GO_VERSION=1.22.1" \
--build-arg="NODE_MAJOR=21" \
--build-arg="USER_NAME=bob" \
--build-arg="K9S_VERSION=0.32.3" \
--build-arg="KUBECTL_VERSION=1.29.2" \
--push -t philippecharriere494/kube-demo-workspace:0.0.0 .

docker pull philippecharriere494/kube-demo-workspace:0.0.0
docker images | grep kube-demo-workspace


: <<'END_COMMENT'
If you get this error message:
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.

Try the following command:
docker buildx create --use desktop-linux

And try again
END_COMMENT

