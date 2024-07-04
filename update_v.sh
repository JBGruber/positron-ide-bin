#!/bin/bash

api_url="https://api.github.com/repos/posit-dev/positron/tags"
latest_tag=$(curl -s "$api_url" | grep -m 1 -oP '"name": "\K(.*?)(?=")')
formatted_version=${latest_tag//-/_}
sed -i "s/pkgver=.*/pkgver=$formatted_version/" PKGBUILD

echo "Updated PKGBUILD with the latest version: $formatted_version"
