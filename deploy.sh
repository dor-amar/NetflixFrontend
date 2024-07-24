#!/bin/bash

# Variables
CONTAINER_NAME="netflix-movie-catalog"
IMAGE_NAME="doramar97/netflix-movie-catalog:latest"

# Stop and remove the existing container if it exists
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Pull the latest Docker image
docker pull $IMAGE_NAME

# Run the new container
docker run \
  -e MOVIE_CATALOG_SERVICE=http://netflix-movie-catalog:8080 \
  -d \
  -p 3000:3000 \
  --name netflix-frontend \
  --network netflix \
  doramar97/netflix-frontend:latest