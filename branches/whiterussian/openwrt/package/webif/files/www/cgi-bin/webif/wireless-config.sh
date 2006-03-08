#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh
load_settings "wireless"

CC=${wl0_country_code:-$(nvram get wl0_country_code)}
case "$CC" in
	All|all|ALL) CHANNELS="1 2 3 4 5 6 7 8 9 10 11 12 13 14"; CHANNEL_MAX=14 ;;
	*) CHANNELS="1 2 3 4 5 6 7 8 9 10 11"; CHANNEL_MAX=11 ;;
esac
F_CHANNELS="option|0|@TR<<Auto>>"
for ch in $CHANNELS; do
	F_CHANNELS="${F_CHANNELS}
option|$ch"
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
	FORM_broadcast=${wl0_closed:-$(nvram get wl0_closed)}
	case "$FORM_broadcast" in
		1|off|disabled) FORM_broadcast=1;;
		*) FORM_broadcast=0;;
	esac
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
		*)
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
		wpa) V_RADIUS="
string|FORM_radius_key|@TR<<RADIUS Server Key>>|min=4 max=63 required|$FORM_radius_key
ip|FORM_radius_ipaddr|@TR<<RADIUS IP Address>>|required|$FORM_radius_ipaddr";;
		psk) V_PSK="wpapsk|FORM_wpa_psk|@TR<<WPA PSK#WPA Pre-Shared Key>>|required|$FORM_wpa_psk";;
		wep) V_WEP="
int|FORM_key|@TR<<Selected WEP Key>>|min=1 max=4|$FORM_key
wep|FORM_key1|@TR<<WEP Key>> 1||$FORM_key1
wep|FORM_key2|@TR<<WEP Key>> 2||$FORM_key2
wep|FORM_key3|@TR<<WEP Key>> 3||$FORM_key3
wep|FORM_key4|@TR<<WEP Key>> 4||$FORM_key4";;
	esac

	validate <<EOF
int|FORM_radio|wl0_radio|required min=0 max=1|$FORM_radio
int|FORM_broadcast|wl0_closed|required min=0 max=1|$FORM_broadcast
string|FORM_ssid|@TR<<ESSID>>|required|$FORM_ssid
int|FORM_channel|@TR<<Channel>>|required min=0 max=$CHANNEL_MAX|$FORM_channel
$V_WEP
$V_RADIUS
$V_PSK
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
		save_setting wireless wl0_closed "$FORM_broadcast"
		save_setting wireless wl0_channel "$FORM_channel"
	
		crypto=""
		equal "$FORM_aes" aes && crypto="aes"
		equal "$FORM_tkip" tkip && crypto="tkip${crypto:++$crypto}"
		save_setting wireless wl0_crypto "$crypto"

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

header "Network" "Wireless" "@TR<<Wireless Configuration>>" ' onLoad="modechange()" ' "$SCRIPT_NAME"

cat <<EOF
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">
<!--
function modechange()
{
	if (isset('mode','adhoc')) {
		document.getElementById('encryption_psk').disabled = true;
		if (isset('encryption','psk')) {
				document.getElementById('encryption').value = 'off';
		}
	} else {
		document.getElementById('encryption_psk').disabled = false;
	}
	
	if (!isset('mode','ap')) {
		document.getElementById('encryption_wpa').disabled = true;
		if (value('encryption') == 'wpa') {
				document.getElementById('encryption').value = 'off';
		}
	} else {
		document.getElementById('encryption_wpa').disabled = false;
	}

	var v = (isset('encryption','wpa') || isset('encryption','psk'));
	set_visible('wpa_support', v);
	set_visible('wpa_crypto', v);
	
	set_visible('wpapsk', isset('encryption','psk'));
	set_visible('wep_keys', isset('encryption','wep'));

	v = isset('encryption','wpa');
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
start_form|@TR<<Wireless Configuration>>
field|@TR<<Wireless Interface>>
select|radio|$FORM_radio
option|1|@TR<<Enabled>>
option|0|@TR<<Disabled>>
field|@TR<<ESSID Broadcast>>
select|broadcast|$FORM_broadcast
option|0|@TR<<Show>>
option|1|@TR<<Hide>>
field|@TR<<ESSID>>
text|ssid|$FORM_ssid
helpitem|ESSID
helptext|Helptext ESSID#Name of your Wireless Network
field|@TR<<Channel>>
select|channel|$FORM_channel
$F_CHANNELS
field|@TR<<WLAN Mode#Mode>>
select|mode|$FORM_mode
option|ap|@TR<<Access Point>>
option|sta|@TR<<Client>>
option|wet|@TR<<Client>> (@TR<<Bridge>>)
option|adhoc|@TR<<Ad-Hoc>>
helpitem|WLAN Mode#Mode
helptext|Helptext Operation mode#This sets the operation mode of your wireless network. Selecting 'Client (Bridge)' will not change your network interface settings. It will only set some parameters in the wireless driver that allow for limited bridging of the interface.
helplink|http://wiki.openwrt.org/OpenWrtDocs/Configuration#head-7126c5958e237d603674b3a9739c9d23bdfdb293
end_form
start_form|@TR<<Encryption Settings>>
field|@TR<<Encryption Type>>
select|encryption|$FORM_encryption
option|off|@TR<<Disabled>>
option|wep|WEP
option|psk|WPA (@TR<<PSK>>)
option|wpa|WPA (RADIUS)
helpitem|Encryption Type
helptext|Helptext Encryption Type#'WPA (RADIUS)' is only supported in Access Point mode. <br /> 'WPA (PSK)' doesn't work in Ad-Hoc mode.
field|@TR<<WPA Mode>>|wpa_support|hidden
checkbox|wpa1|$FORM_wpa1|wpa1|WPA1
checkbox|wpa2|$FORM_wpa2|wpa2|WPA2
field|@TR<<WPA Algorithms>>|wpa_crypto|hidden
checkbox|tkip|$FORM_tkip|tkip|RC4 (TKIP)
checkbox|aes|$FORM_aes|aes|AES
field|WPA @TR<<PSK>>|wpapsk|hidden
text|wpa_psk|$FORM_wpa_psk
field|@TR<<RADIUS IP Address>>|radius_ip|hidden
text|radius_ipaddr|$FORM_radius_ipaddr
field|@TR<<RADIUS Server Key>>|radiuskey|hidden
text|radius_key|$FORM_radius_key
field|@TR<<WEP Keys>>|wep_keys|hidden
radio|key|$FORM_key|1
text|key1|$FORM_key1|<br />
radio|key|$FORM_key|2
text|key2|$FORM_key2|<br />
radio|key|$FORM_key|3
text|key3|$FORM_key3|<br />
radio|key|$FORM_key|4
text|key4|$FORM_key4|<br />
end_form
EOF

footer ?>
<!--
##WEBIF:name:Network:3:Wireless
-->
