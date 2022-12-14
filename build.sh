#!/bin/bash

for image in images/*; do
  tag=$(basename "$image")
  docker build -t "bjaskulski/wordpress:$tag" "$image"
#   docker push "bjaskulski/wordpress:$tag"
done
