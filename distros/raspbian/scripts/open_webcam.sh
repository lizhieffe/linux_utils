#/bin/sh

# Requires to install VLC first.

# Exit on error.
set -e

cvlc v4l2:///dev/video0 --demux h264
