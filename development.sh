#!/usr/bin/env bash
#
# Simple wrap-around script for development.

echo " --> stopping existing environment"
docker-compose down || true

echo " --> pulling new image(s)"
docker-compose pull

echo " --> starting stack"
docker-compose up -d
docker-compose logs -f
