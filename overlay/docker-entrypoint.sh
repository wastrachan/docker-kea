#!/usr/bin/env sh
set -e

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Starting Kea..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Copy default config files
if [ ! -f "/config/kea.conf" ]; then
    echo "    [+] Configuration not present"
    echo "    [+] Creating default configuration at /config/kea.conf"
    cp /defaults/kea.conf /config/kea.conf
fi

echo ""
exec "$@"
