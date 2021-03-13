#!/bin/sh

if [ "$#" -ne 3 ]; then
    echo "Usage: ./image2video.sh <image_file> <audio_file> <output_file>"
    exit 1
fi

IMAGE_FILE="$1"
AUDIO_FILE="$2"
OUTPUT_FILE="$3"

set -eu

ffmpeg -loop 1 -r 1 -i "$IMAGE_FILE" -i "$AUDIO_FILE" -c:v libx264 -crf 20 -pix_fmt yuv420p -c:a copy -shortest "$OUTPUT_FILE"
