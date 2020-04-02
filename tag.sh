#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 TAG"
  echo "Example: $0 3.8.2-slim-v1.0"
  exit 1
fi

tag=$1
url=https://github.com/tschaume/shrink-linalg/blob/$tag/Dockerfile
echo "- [$tag]($url): " `cat requirements.txt | tr '\n' ' '` >> README.md

git add README.md
git commit -m "$tag"
git tag $tag
git push
git push --tags
