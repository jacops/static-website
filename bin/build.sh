#!/usr/bin/env sh
set -euo pipefail

rm -rf dist && mkdir -p dist

cp -rf src/* dist/
envsubst < src/index.html > dist/index.html
