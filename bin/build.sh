#!/usr/bin/env sh
set -euo pipefail

rm -rf dist && mkdir -p dist

cp -rf images dist/
envsubst < index.html > dist/index.html
