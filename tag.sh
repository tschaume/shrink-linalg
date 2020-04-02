#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 TAG"
  echo "Example: $0 3.8.2-slim-v1.0"
  exit 1
fi

tag=$1
url=https://github.com/tschaume/shrink-linalg/blob/$tag/Dockerfile
reqs=`sed 's/==/-/g' requirements.txt | tr '\n' ' ' | xargs | sed 's/ / • /g'`
echo "- [$tag]($url): $reqs" >> README.md
git add README.md
git commit -m "$tag"
git tag $tag
git push
git push --tags
