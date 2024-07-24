#!/bin/bash

docker stop nginx
docker rm nginx

docker run -d \
  --name nginx \
  --network netflix \
  -p 80:80 \
  -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx:latest