#!/bin/sh
set -e

echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin

git clone "https://github.com/$1.git"
cd "$(basename "$1")"

docker build -t "$2" .
docker push "$2"
