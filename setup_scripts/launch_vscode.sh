#! /bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" #gets the current directory

#move to the project root folder
cd "$SCRIPT_DIR"/..

git submodule update --init --recursive
CONTAINER_NAME=${PWD##*/}

IMAGE_NAME="$CONTAINER_NAME:dev"

echo "stopping existing container" "$CONTAINER_NAME"
docker kill "$CONTAINER_NAME" || true
docker stop "$CONTAINER_NAME" || true

CONTAINER_HEX=$(printf $CONTAINER_NAME | xxd -p | tr '\n' ' ' | sed 's/\\s//g' | tr -d ' ')

rocker --user --nvidia --x11 --git --name "$CONTAINER_NAME" --volume "${PWD}":$HOME/"${CONTAINER_NAME}":Z --oyr-run-arg " --entrypoint $HOME/${CONTAINER_NAME}/setup_scripts/entrypoint/entrypoint.sh --detach" $IMAGE_NAME /bin/bash

# #this follows the same convention as if it were opened by a vscode devcontainer
code --folder-uri vscode-remote://attached-container+"$CONTAINER_HEX"$HOME/"${CONTAINER_NAME}"
