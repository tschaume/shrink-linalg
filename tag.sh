#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 TAG"
  echo "Example: $0 3.8.2-slim-1.0"
  exit 1
fi

tag=$1
git tag $tag
url=https://github.com/tschaume/shrink-linalg/blob/$tag/Dockerfile
echo "- [$tag]($url): " `cat requirements.txt | tr '\n' ' '` >> README.md
