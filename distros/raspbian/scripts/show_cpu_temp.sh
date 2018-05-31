#/bin/sh

# Exit on error.
set -e

watch -n 3 /opt/vc/bin/vcgencmd measure_temp
