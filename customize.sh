##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment DEBUG if you want full debug logs (saved to /sdcard)
#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#DEBUG=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
/system/etc/hosts
/system/etc/hosts.tmp
/system/bin/mv
/system/bin/sed
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  :
  set_perm_recursive $MODPATH/system/etc/hosts 0 0 0644 0755
  set_perm  $MODPATH/system/bin/stevenblock  0  0  0777
  set_perm  $MODPATH/system/bin/curl  0  0  0777
  set_perm  $MODPATH/system/bin/mv  0  0  0777
  set_perm  $MODPATH/system/bin/sed  0  0  0777
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
