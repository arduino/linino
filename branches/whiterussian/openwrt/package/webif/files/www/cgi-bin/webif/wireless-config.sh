#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings "wireless"

FORM_wds="${wl0_wds:-$(nvram get wl0_wds)}"
LISTVAL="$FORM_wds"
handle_list "$FORM_wdsremove" "$FORM_wdsadd" "$FORM_wdssubmit" 'mac|FORM_wdsadd|WDS MAC address|required' && {
	FORM_wds="$LISTVAL"
	save_setting wireless wl0_wds "$FORM_wds"
}
FORM_wdsadd=${FORM_wdsadd:-00:00:00:00:00:00}

CC=${wl0_country_code:-$(nvram get wl0_country_code)}
case "$CC" in
	All|all|ALL) CHANNELS="1 2 3 4 5 6 7 8 9 10 11 12 13 14"; CHANNEL_MAX=14 ;;
	*) CHANNELS="1 2 3 4 5 6 7 8 9 10 11"; CHANNEL_MAX=11 ;;
esac
F_CHANNELS=""
for ch in $CHANNELS; do
	F_CHANNELS="${F_CHANNELS}option|$ch
"
done


if empty "$FORM_submit"; then
	FORM_mode=${wl0_mode:-$(nvram get wl0_mode)}
	infra=${wl0_infra:-$(nvram get wl0_infra)}
	case "$infra" in
		0|off|disabled) FORM_mode=adhoc;;
	esac
	FORM_radio=${wl0_radio:-$(nvram get wl0_radio)}
	case "$FORM_radio" in
		0|off|diabled) FORM_radio=0;;
		*) FORM_radio=1;;
	esac
			
	FORM_ssid=${wl0_ssid:-$(nvram get wl0_ssid)}
	FORM_channel=${wl0_channel:-$(nvram get wl0_channel)}
	FORM_encryption=off
	akm=${wl0_akm:-$(nvram get wl0_akm)}
	case "$akm" in
		psk)
			FORM_encryption=psk
			FORM_wpa1=wpa1
			;;
		psk2)
			FORM_encryption=psk
			FORM_wpa2=wpa2
			;;
		'psk psk2')
			FORM_encryption=psk
			FORM_wpa1=wpa1
			FORM_wpa2=wpa2
			;;
		wpa)
			FORM_encryption=wpa
			FORM_wpa1=wpa1
			;;
		wpa2)
			FORM_encryption=wpa
			FORM_wpa2=wpa2
			;;
		'wpa wpa2')
			FORM_encryption=wpa
			FORM_wpa1=wpa1
			FORM_wpa2=wpa2
			;;
		*)
			FORM_wpa1=wpa1
			;;
	esac
	FORM_wpa_psk=${wl0_wpa_psk:-$(nvram get wl0_wpa_psk)}
	FORM_radius_key=${wl0_radius_key:-$(nvram get wl0_radius_key)}
	FORM_radius_ipaddr=${wl0_radius_ipaddr:-$(nvram get wl0_radius_ipaddr)}
	crypto=${wl0_crypto:-$(nvram get wl0_crypto)}
	case "$crypto" in
		tkip)
			FORM_tkip=tkip
			;;
		aes)
			FORM_aes=aes
			;;
		'tkip+aes'|'aes+tkip')
			FORM_aes=aes
			FORM_tkip=tkip
			;;
	esac
	equal "$FORM_encryption" "off" && {
		wep=${wl0_wep:-$(nvram get wl0_wep)}
		case "$wep" in
			1|enabled|on) FORM_encryption=wep;;
			*) FORM_encryption=off;;
		esac
	}
	FORM_key1=${wl0_key1:-$(nvram get wl0_key1)}
	FORM_key2=${wl0_key2:-$(nvram get wl0_key2)}
	FORM_key3=${wl0_key3:-$(nvram get wl0_key3)}
	FORM_key4=${wl0_key4:-$(nvram get wl0_key4)}
	key=${wl0_key:-$(nvram get wl0_key)}
	FORM_key=${key:-1}
else
	SAVED=1
	case "$FORM_encryption" in
		wpa) V_RADIUS="required";;
		psk) V_PSK="required";;
	esac

	validate <<EOF
int|FORM_radio|Radio On/Off|required min=0 max=1|$FORM_radio
ip|FORM_radius_ipaddr|RADIUS IP address|$V_RADIUS|$FORM_radius_ipaddr
wep|FORM_key1|WEP key 1||$FORM_key1
wep|FORM_key2|WEP key 2||$FORM_key2
wep|FORM_key3|WEP key 3||$FORM_key3
wep|FORM_key4|WEP key 4||$FORM_key4
string|FORM_wpa_psk|WPA pre-shared key|min=8 max=63 $V_PSK|$FORM_wpa_psk
string|FORM_radius_key|RADIUS server key|min=4 max=63 $V_RADIUS|$FORM_radius_key
string|FORM_ssid|ESSID|required|$FORM_ssid
int|FORM_channel|Channel|required min=1 max=$CHANNEL_MAX|$FORM_channel
EOF
	equal "$?" 0 && {
		save_setting wireless wl0_radio "$FORM_radio"

		if equal "$FORM_mode" adhoc; then
			FORM_mode=sta
			infra="0"
		fi
		save_setting wireless wl0_mode "$FORM_mode"
		save_setting wireless wl0_infra ${infra:-1}
			
		save_setting wireless wl0_ssid "$FORM_ssid"
		save_setting wireless wl0_channel "$FORM_channel"
	
		crypto=""
		equal "$FORM_aes" aes && crypto="aes"
		equal "$FORM_tkip" tkip && crypto="tkip${crypto:++$crypto}"

		case "$FORM_encryption" in
			psk)
				case "${FORM_wpa1}${FORM_wpa2}" in
					wpa1) save_setting wireless wl0_akm "psk";;
					wpa2) save_setting wireless wl0_akm "psk2";;
					wpa1wpa2) save_setting wireless wl0_akm "psk psk2";;
				esac
				save_setting wireless wl0_wpa_psk "$FORM_wpa_psk"
				save_setting wireless wl0_wep "disabled"
				;;
			wpa)
				case "${FORM_wpa1}${FORM_wpa2}" in
					wpa1) save_setting wireless wl0_akm "wpa";;
					wpa2) save_setting wireless wl0_akm "wpa2";;
					wpa1wpa2) save_setting wireless wl0_akm "wpa wpa2";;
				esac
				save_setting wireless wl0_radius_ipaddr "$FORM_radius_ipaddr"
				save_setting wireless wl0_radius_key "$FORM_radius_key"
				save_setting wireless wl0_wep "disabled"
				;;
			wep)
				save_setting wireless wl0_wep enabled
				save_setting wireless wl0_akm "none"
				save_setting wireless wl0_key1 "$FORM_key1"
				save_setting wireless wl0_key2 "$FORM_key2"
				save_setting wireless wl0_key3 "$FORM_key3"
				save_setting wireless wl0_key4 "$FORM_key4"
				save_setting wireless wl0_key "$FORM_key"
				;;
			off)
				save_setting wireless wl0_akm "none"
				save_setting wireless wl0_wep disabled
				;;
		esac
	}
fi

header "Network" "Wireless" "Wireless settings" ' onLoad="modechange()" ' "$SCRIPT_NAME"

cat <<EOF
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">
<!--
function modechange()
{
	if (checked('mode_adhoc')) {
		var psk = document.getElementById('encryption_psk');
		psk.disabled = true;
		if (psk.checked) {
				psk.checked = false;
				document.getElementById('encryption_off').checked = true;
		}
	} else {
		document.getElementById('encryption_psk').disabled = false;
	}
	if (checked('mode_wet') || checked('mode_sta') || checked('mode_adhoc')) {
		var wpa = document.getElementById('encryption_wpa');
		wpa.disabled = true;
		if (wpa.checked) {
				wpa.checked = false;
				document.getElementById('encryption_off').checked = true;
		}
	} else {
		document.getElementById('encryption_wpa').disabled = false;
	}
	
	var v = (checked('encryption_wpa') || checked('encryption_psk'));
	set_visible('wpa_support', v);
	set_visible('wpa_crypto', v);
	
	set_visible('wpapsk', checked('encryption_psk'));
	set_visible('wep_keys', checked('encryption_wep'));

	v = checked('encryption_wpa');
	set_visible('radiuskey', v);
	set_visible('radius_ip', v);

	hide('save');
	show('save');
}
-->
</script>

EOF

display_form <<EOF
onchange|modechange
start_form|Wireless Configuration
field|Power
radio|radio|$FORM_radio|1|Enabled<br />
radio|radio|$FORM_radio|0|Disabled
field|ESSID
text|ssid|$FORM_ssid
helpitem|ESSID
helptext|Name of your Wireless Network
field|Channel
select|channel|$FORM_channel
$F_CHANNELS
field|Mode
radio|mode|$FORM_mode|ap|Access Point<br />
radio|mode|$FORM_mode|sta|Client <br />
radio|mode|$FORM_mode|wet|Bridge <br />
radio|mode|$FORM_mode|adhoc|Ad-Hoc
helpitem|Mode
helptext|Operation mode
helplink|http://wiki.openwrt.org/OpenWrtDocs/Configuration#head-7126c5958e237d603674b3a9739c9d23bdfdb293
end_form
start_form|Encryption settings
field|Encryption type
radio|encryption|$FORM_encryption|off|Disabled <br />
radio|encryption|$FORM_encryption|wep|WEP <br />
radio|encryption|$FORM_encryption|psk|WPA (preshared key) <br />
radio|encryption|$FORM_encryption|wpa|WPA (RADIUS)
field|WPA support|wpa_support|hidden
checkbox|wpa1|$FORM_wpa1|wpa1|WPA1
checkbox|wpa2|$FORM_wpa2|wpa2|WPA2
field|WPA encryption type|wpa_crypto|hidden
checkbox|tkip|$FORM_tkip|tkip|RC4 (TKIP)
checkbox|aes|$FORM_aes|aes|AES
field|WPA preshared key|wpapsk|hidden
text|wpa_psk|$FORM_wpa_psk
field|RADIUS Server IP|radius_ip|hidden
text|radius_ipaddr|$FORM_radius_ipaddr
field|RADIUS Server Key|radiuskey|hidden
text|radius_key|$FORM_radius_key
field|WEP keys|wep_keys|hidden
radio|key|$FORM_key|1
text|key1|$FORM_key1|<br />
radio|key|$FORM_key|2
text|key2|$FORM_key2|<br />
radio|key|$FORM_key|3
text|key3|$FORM_key3|<br />
radio|key|$FORM_key|4
text|key4|$FORM_key4|<br />
end_form
start_form|WDS connections
listedit|wds|$SCRIPT_NAME?|$FORM_wds|$FORM_wdsadd
helpitem|Note
helptext|You should save your settings on this page before adding/removing WDS links
end_form
EOF

footer ?>
<!--
##WEBIF:name:Network:3:Wireless
-->
