#!/bin/bash

# stop the running container
docker ps | grep "social-media-backend-app" | awk '{print $1}' | xargs docker stop

docker build . -t social-media-backend-app
docker run \
    -p 4567:4567 \
    -d \
    social-media-backend-app
    --restart unless-stopped \
    social-media-backend-app
