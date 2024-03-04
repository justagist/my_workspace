#! /bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #gets the current directory

#move to the project root folder
cd "$SCRIPT_DIR"/..

git submodule update --init --recursive

CONTAINER_NAME=${PWD##*/}  

echo "stopping existing container" "$CONTAINER_NAME" 
docker stop "$CONTAINER_NAME" || true 

CONTAINER_HEX=$(printf $CONTAINER_NAME | xxd -p | tr '\n' ' ' | sed 's/\\s//g' | tr -d ' ');

export DEBIAN_FRONTEND=noninteractive

rocker --nvidia --x11 --user --pull --env DEBIAN_FRONTEND=noninteractive --git --name "$CONTAINER_NAME" --volume "${PWD}":$HOME/workspaces/"${CONTAINER_NAME}":Z --oyr-run-arg " --detach" --deps-dependencies ros:humble

# docker pull ghcr.io/red5d/docker-autocompose:latest
# docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/red5d/docker-autocompose $CONTAINER_NAME > .devcontainer/docker-compose.yaml

#this follows the same convention as if it were opened by a vscode devcontainer
code --folder-uri vscode-remote://attached-container+"$CONTAINER_HEX"$HOME/workspaces/"${CONTAINER_NAME}"