#/bin/sh

# Requirement
# 1. Movidius stick
# 2. Movidius SDK

# Exit on error.
set -e

IMAGE=/tmp/img.jpg

fswebcam "$IMAGE"
cd "$HOME"/installed/ncappzoo/apps/image-classifier
python3 image-classifier.py --image="$IMAGE"
