#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings system
load_settings nvram

[ -z $FORM_submit ] && {
		FORM_hostname=${wan_hostname:-$(nvram get wan_hostname)}
		FORM_hostname=${FORM_hostname:-OpenWrt}
		grep BCM947 /proc/cpuinfo 2>&- >&- && {
			FORM_boot_wait=${boot_wait:-$(nvram get boot_wait)}
			FORM_boot_wait=${FORM_boot_wait:-off}
		}
} || {
		SAVED=1
		[ -z $FORM_hostname ] || save_setting system wan_hostname $FORM_hostname
		grep BCM947 /proc/cpuinfo 2>&- >&- && {
			[ -z $FORM_boot_wait ] || save_setting nvram boot_wait $FORM_boot_wait
		}
}
header "System" "Settings" "System settings" '' "$SCRIPT_NAME"

grep BCM947 /proc/cpuinfo 2>&- >&- && bootwait_form="field|boot_wait
radio|boot_wait|$FORM_boot_wait|on|On<br />
radio|boot_wait|$FORM_boot_wait|off|Off"

display_form "start_form|System settings
field|Hostname
text|hostname|$FORM_hostname
$bootwait_form
field
end_form"
?>

<? footer ?>
<!--
##WEBIF:name:System:1:Settings
-->
