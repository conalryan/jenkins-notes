#!/bin/bash

RELEASE=$1

VERSION=$2
# Trim whitespace
VERSION=$(echo ${VERSION} | xargs)

TOKEN=$3

echo ${TOKEN} | docker login -u some-user --password-stdin dockerhub.com:5000
docker build -t "dockerhub.com:5000/myapp:{RELEASE}.x" --build-arg version="${VERSION}" .
docker push "dockerhub.com:5000/myapp:${VERSION}"
