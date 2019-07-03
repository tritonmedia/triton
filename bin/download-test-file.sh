#!/usr/bin/env bash
# Download the test file

if [[ -e "/tmp/Bunny.mkv" ]]; then
  rm -rf /tmp/Bunny.mkv
fi

wget -O /tmp/Bunny.mkv https://s3.amazonaws.com/x265.org/video/BigBuckBunny_2000hevc.mp4
