#/bin/sh

# Requirement:
# sudo apt-get install fswebcam

# Exit on error.
set -e

IMAGE=/tmp/img.jpg

fswebcam "$IMAGE"
gpicview "$IMAGE"

