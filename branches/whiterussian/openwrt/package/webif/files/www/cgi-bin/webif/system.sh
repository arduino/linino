#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings system
load_settings nvram

if empty "$FORM_submit"; then
	FORM_hostname=${wan_hostname:-$(nvram get wan_hostname)}
	FORM_hostname=${FORM_hostname:-OpenWrt}
	grep BCM947 /proc/cpuinfo 2>&- >&- && {
		FORM_boot_wait=${boot_wait:-$(nvram get boot_wait)}
		FORM_boot_wait=${FORM_boot_wait:-off}
	}
else
	SAVED=1
	validate "hostname|FORM_hostname|Hostname|nodots required|$FORM_hostname" && {
		save_setting system wan_hostname $FORM_hostname
		grep BCM947 /proc/cpuinfo 2>&- >&- && {
			case "$FORM_boot_wait" in
				on|off) save_setting nvram boot_wait $FORM_boot_wait;;
			esac
		}
	}
fi

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

footer ?>

<!--
##WEBIF:name:System:1:Settings
-->
