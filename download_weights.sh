#!/usr/bin/env bash
set -e

DEST="Code/yolov3.weights"
URL="https://github.com/rishishanthan/traffic-object-detection-yolov3/releases/download/v1.0.0/yolov3.weights"

mkdir -p "$(dirname "$DEST")"
if [ ! -f "$DEST" ]; then
  echo "Downloading YOLOv3 weights (~237 MB)…"
  curl -L -o "$DEST" "$URL"
  echo "Done: $DEST"
else
  echo "Weights already exist at $DEST"
fi

