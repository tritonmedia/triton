#!/usr/bin/env bash
# Download the test file, if it doesn't exist

if [[ -e "/tmp/Bunny.mkv" ]]; then
  exit 0
fi

curl -L https://s3.amazonaws.com/x265.org/video/BigBuckBunny_2000hevc.mp4 > /tmp/Bunny.mkv
