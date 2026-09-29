#!/system/bin/sh
MODDIR=${0%/*}
CLI="$MODDIR/system/bin/konabess-cli"

# Wait for system boot completion
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 3
done
sleep 2

if [ -x "$CLI" ]; then
    "$CLI" status >> "$MODDIR/service.log" 2>&1
fi
