#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh
load_settings system
load_settings nvram
load_settings webif

if empty "$FORM_submit"; then
	FORM_hostname="${wan_hostname:-$(nvram get wan_hostname)}"
	FORM_hostname="${FORM_hostname:-OpenWrt}"
	FORM_language="${language:-$(nvram get language)}"
	FORM_language="${FORM_language:-default}"
	is_bcm947xx && {
		FORM_boot_wait="${boot_wait:-$(nvram get boot_wait)}"
		FORM_boot_wait="${FORM_boot_wait:-off}"
	}
else
	SAVED=1
	validate <<EOF
hostname|FORM_hostname|Hostname|nodots required|$FORM_hostname
EOF
	equal "$?" 0 && {
		save_setting system wan_hostname "$FORM_hostname"
		save_setting webif language "$FORM_language"
		is_bcm947xx && {
			case "$FORM_boot_wait" in
				on|off) save_setting nvram boot_wait "$FORM_boot_wait";;
			esac
		}
	}
fi

LANGUAGES="$(grep '^[\t ]*lang[\t ]*=>' /usr/lib/webif/lang/*/*.txt | awk -f /usr/lib/webif/languages.awk)"

header "System" "Settings" "@TR<<System Settings>>" '' "$SCRIPT_NAME"

is_bcm947xx && bootwait_form="field|boot_wait
select|boot_wait|$FORM_boot_wait
option|on|@TR<<Enabled>>
option|off|@TR<<Disabled>>"

display_form <<EOF
start_form|@TR<<System Settings>>
field|@TR<<Host Name>>
text|hostname|$FORM_hostname
$bootwait_form
field|Language
select|language|$FORM_language
$LANGUAGES
end_form
EOF

footer ?>

<!--
##WEBIF:name:System:1:Settings
-->
