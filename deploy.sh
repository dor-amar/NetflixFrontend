#!/bin/bash

# Variables
CONTAINER_NAME="netflix-frontend"
IMAGE_NAME="doramar97/netflix-frontend:latest"

docker pull $IMAGE_NAME
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run the new container
docker run \
  -e MOVIE_CATALOG_SERVICE=http://netflix-movie-catalog:8080 \
  -d \
  -p 3000:3000 \
  --name netflix-frontend \
  --network netflix \
  doramar97/netflix-frontend:latest
  
  