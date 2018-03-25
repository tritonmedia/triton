#!/usr/bin/env bash
#
# Simple wrap-around script for development.

echo " --> pulling new image(s)"
docker-compose pull

echo " --> starting stack"
docker-compose up