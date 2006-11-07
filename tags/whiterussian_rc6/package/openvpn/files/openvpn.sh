#!/usr/bin/webif-page "-U /tmp -u 4096"
<?
# add haserl args in double quotes it has very ugly
# command line parsing code!

. /usr/lib/webif/webif.sh
load_settings "openvpn"

openvpn_cli_pkcs12pass=${openvpn_cli_pkcs12pass:-$(nvram get openvpn_cli_pkcs12pass)}
openvpn_cli_pkcs12pass=${openvpn_cli_pkcs12pass:+"-@@-"}

if empty "$FORM_submit"; then
	[ -f /etc/openvpn/certificate.p12 ] ||
		NOCERT=1
	[ -f /etc/openvpn/shared.key ] ||
		NOPSK=1
	FORM_openvpn_cli=${openvpn_cli:-$(nvram get openvpn_cli)}
	FORM_openvpn_cli_server=${openvpn_cli_server:-$(nvram get openvpn_cli_server)}
	FORM_openvpn_cli_proto=${openvpn_cli_proto:-$(nvram get openvpn_cli_proto)}
	FORM_openvpn_cli_port=${openvpn_cli_port:-$(nvram get openvpn_cli_port)}
	FORM_openvpn_cli_port=${FORM_openvpn_cli_port:-1194}
	FORM_openvpn_cli_auth=${openvpn_cli_auth:-$(nvram get openvpn_cli_auth)}
	FORM_openvpn_cli_auth=${FORM_openvpn_cli_auth:-cert)}
	FORM_openvpn_cli_psk=${openvpn_cli_psk:-$(nvram get openvpn_cli_psk)}
else
	[ -d /etc/openvpn ] || mkdir /etc/openvpn
	[ -f "$FORM_openvpn_cli_pkcs12file" ] && {
		cp "$FORM_openvpn_cli_pkcs12file" /etc/openvpn/certificate.p12 &&
			UPLOAD_CERT=1
	}
	[ -f "$FORM_openvpn_cli_pskfile" ] && {
		cp "$FORM_openvpn_cli_pskfile" /etc/openvpn/shared.key &&
			UPLOAD_PSK=1
	}
	[ "$FORM_openvpn_cli_pkcs12pass" != "-@@-" ] && {
		[ "$FORM_openvpn_cli_pkcs12pass" != "$openvpn_cli_pkcs12pass" ] && {
			save_setting openvpn openvpn_cli_pkcs12pass $FORM_openvpn_cli_pkcs12pass
			openvpn_cli_pkcs12pass=${FORM_openvpn_cli_pkcs12pass:+"-@@-"}
		}
	}

	save_setting openvpn openvpn_cli $FORM_openvpn_cli
	save_setting openvpn openvpn_cli_server $FORM_openvpn_cli_server
	save_setting openvpn openvpn_cli_proto $FORM_openvpn_cli_proto
	save_setting openvpn openvpn_cli_port $FORM_openvpn_cli_port
	save_setting openvpn openvpn_cli_auth $FORM_openvpn_cli_auth
	save_setting openvpn openvpn_cli_psk $FORM_openvpn_cli_psk
fi

header "VPN" "OpenVPN" "@TR<<OpenVPN>>" ' onLoad="modechange()" ' "$SCRIPT_NAME"

cat <<EOF
<script type="text/javascript" src="/webif.js "></script>
<script type="text/javascript">
<!--
function modechange()
{
	var v;
	v = isset('openvpn_cli', '1');
	set_visible('connection_settings', v);
	set_visible('authentication', v);

	v = isset('openvpn_cli_auth', 'psk');
	set_visible('psk_status', v);
	set_visible('psk', v);

	v = isset('openvpn_cli_auth', 'cert');
	set_visible('certificate_status', v);
	set_visible('certificate', v);
	set_visible('pkcs12pass', v);

	hide('save');
	show('save');
}
-->
</script>
EOF

display_form <<EOF
onchange|modechange
start_form|@TR<<OpenVPN>>
field|@TR<<Start VPN Connection>>
select|openvpn_cli|$FORM_openvpn_cli
option|0|@TR<<Disabled>>
option|1|@TR<<Enabled>>
onchange|
end_form

start_form|@TR<<Connection Settings>>|connection_settings|hidden
field|@TR<<Server Address>>
text|openvpn_cli_server|$FORM_openvpn_cli_server
field|@TR<<Protocol>>
select|openvpn_cli_proto|$FORM_openvpn_cli_proto
option|udp|UDP
option|tcp|TCP
field|@TR<<Server Port (default: 1194)>>
text|openvpn_cli_port|$FORM_openvpn_cli_port
field|@TR<<Authentication Method>>
onchange|modechange
select|openvpn_cli_auth|$FORM_openvpn_cli_auth
option|psk|@TR<<Preshared Key>>
option|cert|@TR<<Certificate (PKCS12)>>
onchange|
end_form

start_form|@TR<<Authentication>>|authentication|hidden
field|@TR<<Preshared Key Status>>|psk_status|hidden
$(empty "$NOPSK" || echo 'string|<span style="color:red">@TR<<No Keyfile uploaded yet!>></span>')
$(empty "$UPLOAD_PSK" || echo 'string|<span style="color:green">@TR<<Upload Successful>><br/></span>')
$(empty "$NOPSK" && echo 'string|@TR<<Found Installed Keyfile>>')
field|@TR<<Upload Preshared Key>>|psk|hidden
upload|openvpn_cli_pskfile

field|@TR<<Certificate Status>>|certificate_status|hidden
$(empty "$NOCERT" || echo 'string|<span style="color:red">@TR<<No Certificate uploaded yet!>></span>')
$(empty "$UPLOAD_CERT" || echo 'string|<span style="color:green">@TR<<Upload Successful>><br/></span>')
$(empty "$NOCERT" && echo 'string|@TR<<Found Installed Certificate.>>')
field|@TR<<Upload PKCS12 Certificate>>|certificate|hidden
upload|openvpn_cli_pkcs12file
field|@TR<<PKCS12 Container Password>>|pkcs12pass|hidden
password|openvpn_cli_pkcs12pass|$openvpn_cli_pkcs12pass
end_form

EOF

footer
?>
<!--
##WEBIF:name:VPN:1:OpenVPN
-->
