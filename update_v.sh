#!/bin/bash

# Update version
api_url="https://api.github.com/repos/posit-dev/positron/tags"
latest_tag=$(curl -s "$api_url" | grep -m 1 -oP '"name": "\K[0-9][^"]*(?=")')
formatted_version=${latest_tag//-/_}
sed -i "s/pkgver=.*/pkgver=$formatted_version/" PKGBUILD

# Update checksum
sha=$(curl -sL https://github.com/posit-dev/positron/releases/download/${latest_tag}/Positron-${latest_tag}.deb | sha256sum | awk '{print $1}')
sed -i "s/sha256sums=.*/sha256sums=('$sha')/" PKGBUILD

echo "Updated PKGBUILD with the latest version: $formatted_version"
