#!/bin/bash
if [ -f __iveseenfootage__.mp4 ]; then
    exit 1
fi
ffmpeg -framerate 24 -pattern_type glob -i "$2*.png" __iveseenfootage__.mp4
ffmpeg -stream_loop -1 -i __iveseenfootage__.mp4 -i $1 -shortest -map 0:v:0 -map 1:a:0 -y out.mp4
rm __iveseenfootage__.mp4
