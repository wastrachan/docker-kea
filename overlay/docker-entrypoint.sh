#!/usr/bin/env sh
set -e

echo ""
echo "----------------------------------------"
echo " Starting up Kea...                     "
echo "----------------------------------------"
echo ""

# Copy default config files
if [ ! -f "/config/kea.conf" ]; then
    cp /defaults/kea.conf /config/kea.conf
fi

exec "$@"
