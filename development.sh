#!/usr/bin/env bash
#
# Simple wrap-around script for development.

./bin/download-test-file.sh

echo " --> stopping existing environment"
docker-compose down || true

echo " --> pulling new image(s)"
docker-compose pull

echo " --> starting stack"
docker-compose -f docker-compose.jellyfin.yaml up -d
docker-compose -f docker-compose.jellyfin.yaml logs -f
