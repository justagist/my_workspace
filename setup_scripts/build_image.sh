#! /bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" #gets the current directory

#move to the project root folder
cd "$SCRIPT_DIR"/..

git submodule update --init --recursive
CONTAINER_NAME=${PWD##*/}
TEMP_CONTAINER_NAME="$CONTAINER_NAME-temp"
echo "stopping existing container" "$TEMP_CONTAINER_NAME"
docker kill "$TEMP CONTAINER_NAME" || true
docker stop "$TEMP_CONTAINER_NAME" || true

IMAGE_NAME="$CONTAINER_NAME:dev"

rocker --nvidia --name "$TEMP_CONTAINER_NAME" --image-name "$IMAGE_NAME" --pull --oyr-run-arg " --detach" --deps-dependencies ros:humble

docker kill "$TEMP CONTAINER_NAME" || true
docker stop "$TEMP_CONTAINER_NAME" || true
