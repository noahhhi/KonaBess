SKIPUNZIP=0

ui_print "***********************************************"
ui_print "  KonaBess Native CLI & Auto-Undervolt Module  "
ui_print "  Adreno GPU Undervolter & OTA Persistence     "
ui_print "***********************************************"

ui_print "- Setting binary permissions..."
set_perm_recursive "$MODPATH/bin" 0 0 0755 0755
set_perm "$MODPATH/system/bin/konabess-cli" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755

SOC=$(getprop ro.soc.model)
[ -z "$SOC" ] && SOC=$(getprop ro.board.platform)
ui_print "- Target Device: $(getprop ro.product.model) ($SOC)"
ui_print "- Installed successfully to: $MODPATH"
ui_print "- Usage: open terminal as root and type 'konabess-cli'"
