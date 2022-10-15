#!/usr/bin/env sh
set -e

PUID="${PUID:-100}"
PGID="${PGID:-101}"

echo ""
echo "----------------------------------------"
echo " Starting up using the following:       "
echo "                                        "
echo "     UID: $PUID                         "
echo "     GID: $PGID                         "
echo "----------------------------------------"
echo ""

# Copy default config files
if [ ! -f "/config/kea.conf" ]; then
    cp /defaults/kea.conf /config/kea.conf
fi

# Set UID/GID of software user
sed -i "s/^dhcp\:x\:100\:101/dhcp\:x\:$PUID\:$PGID/" /etc/passwd
sed -i "s/^dhcp\:x\:101/dhcp\:x\:$PGID/" /etc/group

# Ensure lease db exists
touch /config/kea.leases

# Set permissions
chown -R $PUID:$PGID /config

exec "$@"
