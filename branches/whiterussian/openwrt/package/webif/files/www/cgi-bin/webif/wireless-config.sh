#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings "wireless"


WDS=${wl0_wds:-$(nvram get wl0_wds)}
WDS="${WDS# }"
[ -z "$FORM_wdsremove" ] || {
	WDS=$(echo "$WDS " | awk '
BEGIN {
	RS=" "
	FS=":"
	first = 1
}
($0 !~ /^'"$FORM_wdsremove"'/) {
	if (first != 1) printf " "
	printf $0
	first = 0
}
END { print "" }')
	WDS="${WDS:- }"
	save_setting wireless wl0_wds "$WDS"
	FORM_submit=""
}
[ \! -z "$FORM_wdssubmit" ] && {
	validate "mac|FORM_newmac|WDS MAC address||$FORM_newmac" && {
		WDS="$WDS $FORM_newmac"
		WDS="${WDS# }"
		save_setting wireless wl0_wds "$WDS"
	}
	FORM_submit=""
}
if [ -z "$FORM_submit" ]; then
	FORM_newmac=${FORM_newmac:-00:00:00:00:00:00}
	FORM_mode=${wl0_mode:-$(nvram get wl0_mode)}
	FORM_ssid=${wl0_ssid:-$(nvram get wl0_ssid)}
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
	[ $FORM_encryption = off ] && {
		wep=${wl0_wep:-$(nvram get wl0_wep)}
		case "$wep" in
			1|enabled|on) FORM_encryption=wep;;
			*) FORM_encryption=disabled;;
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
	[ "$FORM_encryption" = "wpa" ] && V_RADIUS="required"
	[ "$FORM_encryption" = "psk" ] && V_PSK="required"
	validate "
ip|FORM_radius_ipaddr|RADIUS IP address|$V_RADIUS|$FORM_radius_ipaddr
wep|FORM_key1|WEP key 1||$FORM_key1
wep|FORM_key2|WEP key 2||$FORM_key2
wep|FORM_key3|WEP key 3||$FORM_key3
wep|FORM_key4|WEP key 4||$FORM_key4
string|FORM_wpa_psk|WPA pre-shared key|min=8 max=63 $V_PSK|$FORM_wpa_psk
string|FORM_radius_key|RADIUS server key|min=4 max=63 $V_RADIUS|$FORM_radius_key" && {
		save_setting wireless wl0_mode "$FORM_mode"
		save_setting wireless wl0_ssid "$FORM_ssid"
		case "$FORM_aes$FORM_tkip" in 
			aes) save_setting wireless wl0_crypto aes;;
			tkip) save_setting wireless wl0_crypto tkip;;
			aestkip) save_setting wireless wl0_crypto tkip+aes;;
		esac
		case "$FORM_encryption" in
			psk)
				case "${FORM_wpa1}${FORM_wpa2}" in
					wpa1) save_setting wireless wl0_akm "psk";;
					wpa2) save_setting wireless wl0_akm "psk2";;
					wpa1wpa2) save_setting wireless wl0_akm "psk psk2";;
				esac
				save_setting wireless wl0_wpa_psk "$FORM_wpa_psk"
				;;
			wpa)
				case "${FORM_wpa1}${FORM_wpa2}" in
					wpa1) save_setting wireless wl0_akm "wpa";;
					wpa2) save_setting wireless wl0_akm "wpa2";;
					wpa1wpa2) save_setting wireless wl0_akm "wpa wpa2";;
				esac
				save_setting wireless wl0_radius_ipaddr "$FORM_radius_ipaddr"
				save_setting wireless wl0_radius_key "$FORM_radius_key"
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
?>
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">
<!--
function modechange()
{
	var v = (checked('encryption_wpa') || checked('encryption_psk'));
	set_visible('wpa_support', v);
	set_visible('wpa_crypto', v);
	
	set_visible('wpapsk', checked('encryption_psk'));
	set_visible('wep_keys', checked('encryption_wep'));

	v = checked('encryption_wpa');
	set_visible('radiuskey', v);
	set_visible('radius_ip', v);

	if (checked('mode_wet') || checked('mode_sta')) {
			var wpa = document.getElementById('encryption_wpa');
			wpa.disabled = true;
			if (wpa.checked) {
					wpa.checked = false;
					document.getElementById('encryption_off').checked = true;
			}
	} else {
			document.getElementById('encryption_wpa').disabled = false;
	}
	hide('save');
	show('save');
}
-->
</script>

<? display_form "start_form|Wireless Configuration
field|ESSID
text|ssid|$FORM_ssid
helpitem|ESSID
helptext|Name of your Wireless Network
field|Mode
radio|mode|$FORM_mode|ap|Access Point<br />|onChange=\"modechange()\" 
radio|mode|$FORM_mode|sta|Client <br />|onChange=\"modechange()\" 
radio|mode|$FORM_mode|wet|Bridge|onChange=\"modechange()\" 
helpitem|Mode
helptext|Operation mode
helplink|http://www.google.com
end_form
start_form|Encryption settings
field|Encryption type
radio|encryption|$FORM_encryption|off|Disabled <br />|onChange=\"modechange()\"
radio|encryption|$FORM_encryption|wep|WEP <br />|onChange=\"modechange()\"
radio|encryption|$FORM_encryption|psk|WPA (preshared key) <br />|onChange=\"modechange()\"
radio|encryption|$FORM_encryption|wpa|WPA (RADIUS)|onChange=\"modechange()\"
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
end_form"
?>
<div class="settings">
	<div class="settings-title"><h3><strong>WDS connections</strong></h3></div>
	<div class="settings-content">
	<table summary="Settings" width="100%">
<?
echo "$WDS " | awk '
BEGIN {
	RS=" "
	FS=":"
}

$0 ~ /^[0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]$/ {
	print "<tr><td width=\"50%\">" $0 "</td><td>&nbsp;<a href=\"'"$SCRIPT_NAME"'?wdsremove=" $0 "\">Remove</a></td></tr>"
}
'
?>
		<tr>
			<td width="45%"><input type="text" name="newmac" value="<? echo -n $FORM_newmac ?>" /></td>
			<td width="55%"><input type="submit" name="wdssubmit" value="Add WDS peer" /></td>
		</tr>
	</table>
	</div>
	<div class="settings-help">&nbsp;</div>
</div>
<div style="clear: both">&nbsp;</div>


<? footer ?>
<!--
##WEBIF:name:Network:3:Wireless
-->
