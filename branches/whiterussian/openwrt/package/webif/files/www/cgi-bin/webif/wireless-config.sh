#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
load_settings "wireless"

[ -z $FORM_submit ] && {
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
	true
} || {
	SAVED=1
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
			validate_ip "$FORM_radius_ipaddr" "RADIUS Server" 1 && \
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

header "Network" "Wireless" "Wireless settings" ' onLoad="modechange()" '
?>
<script type="text/javascript" src="/webif.js"></script>
<script type="text/javascript">
<!--
function modechange()
{
	var v = (checked('encryption_wpa') || checked('encryption_psk'));
	set_visible('wpa_support', v);
	set_visible('wpa_crypto', v);
	
	set_visible('wpa_psk', checked('encryption_psk'));
	set_visible('wep_keys', checked('encryption_wep'));

	v = checked('encryption_wpa');
	set_visible('radius_key', v);
	set_visible('radius_ipaddr', v);

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
}
-->
</script>

<?if [ "$SAVED" = "1" ] ?>
	<? [ -z "$ERROR" ] || echo "<h2>Errors occured:</h2><h3>$ERROR</h3>" ?>
	<h2>Settings saved</h2>
	<br />
<?fi?>
<? display_form "start_form:$SCRIPT_NAME
field:ESSID
text:ssid:$FORM_ssid
field:Mode
radio:mode:$FORM_mode:ap:Access Point<br />:onChange=\"modechange()\" 
radio:mode:$FORM_mode:sta:Client <br />:onChange=\"modechange()\" 
radio:mode:$FORM_mode:wet:Bridge:onChange=\"modechange()\" 
field:Encryption type
radio:encryption:$FORM_encryption:off:Disabled <br />:onChange=\"modechange()\"
radio:encryption:$FORM_encryption:wep:WEP <br />:onChange=\"modechange()\"
radio:encryption:$FORM_encryption:psk:WPA (preshared key) <br />:onChange=\"modechange()\"
radio:encryption:$FORM_encryption:wpa:WPA (RADIUS):onChange=\"modechange()\"
field:WPA support:wpa_support
checkbox:wpa1:$FORM_wpa1:wpa1:WPA1
checkbox:wpa2:$FORM_wpa2:wpa2:WPA2
field:WPA encryption type:wpa_crypto
checkbox:tkip:$FORM_tkip:tkip:RC4 (TKIP)
checkbox:aes:$FORM_aes:aes:AES
field:WPA preshared key:wpa_psk
text:wpa_psk:$FORM_wpa_psk
field:RADIUS Server IP:radius_ipaddr
text:radius_ipaddr:$FORM_radius_ipaddr
field:RADIUS Server Key:radius_key
text:radius_key:$FORM_radius_key
field:WEP keys:wep_keys
radio:key:$FORM_key:1
text:key1:$FORM_key1:<br />
radio:key:$FORM_key:2
text:key2:$FORM_key2:<br />
radio:key:$FORM_key:3
text:key3:$FORM_key3:<br />
radio:key:$FORM_key:4
text:key4:$FORM_key4:<br />
field
submit:action:Save settings
end_form"
?>

<? footer ?>
<!--
##WEBIF:name:Network:3:Wireless
-->
