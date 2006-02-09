#!/usr/bin/webif-page -p /bin/sh
. /usr/lib/webif/webif.sh

do_upgrade() {
	# free some memory :)
	ps | grep -vE 'Command|init|\[[kbmj]|httpd|haserl|bin/sh|awk|kill|ps|webif' | awk '{ print $1 }' | xargs kill -KILL
	MEMFREE="$(awk 'BEGIN{ mem = 0 } ($1 == "MemFree:") || ($1 == "Cached:") {mem += int($2)} END{print mem}' /proc/meminfo)"
	empty "$ERASE_NVRAM" || {
		mtd -q erase nvram
	}
	empty "$ERASE_FS" || MTD_OPT="-e linux"
	if [ $(($MEMFREE)) -ge 4096 ]; then
		bstrip "$BOUNDARY" > /tmp/firmware.bin
		mtd $MTD_OPT -q -r write /tmp/firmware.bin linux
	else
		# Not enough memory for storing the firmware on tmpfs
		bstrip "$BOUNDARY" | mtd $MTD_OPT -q -q -r write - linux
	fi
	echo "@TR<<done>>."
}

read_var() {
	NAME=""
	while :; do
		read LINE
		LINE="${LINE%%[^0-9A-Za-z]}"
		equal "$LINE" "$BOUNDARY" && read LINE
		empty "$NAME$LINE" && exit
		case "${LINE%%:*}" in
			Content-Disposition)
				NAME="${LINE##*; name=\"}"
				NAME="${NAME%%\"*}"
			;;
		esac
		empty "$LINE" && return
	done
}


NOINPUT=1
header "System" "Firmware Upgrade" "@TR<<Firmware Upgrade>>"

equal "$REQUEST_METHOD" "GET" && {
	cat <<EOF
	<script type="text/javascript">
	
function statusupdate() {
	document.getElementById("form_submit").style.display = "none";
	document.getElementById("status_text").style.display = "inline";
	document.getElementById("status_text").firstChild.nodeValue = "@TR<<Upgrading...>>";

	return true;
}
	</script>
	<form method="POST" name="upgrade" action="$SCRIPT_NAME" enctype="multipart/form-data" onSubmit="statusupdate()">
	<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
	<tbody>
		<tr>
			<td>@TR<<Options>>:</td>
			<td>
				<input type="checkbox" name="erase_fs" value="1" />@TR<<Erase_JFFS2|Erase JFFS2 partition>><br />
				<input type="checkbox" name="erase_nvram" value="1" />@TR<<Erase NVRAM>>
			</td>
		</tr>
		<tr>
			<td>@TR<<Firmware_image|Firmware image to upload:>></td>
			<td>
				<input type="file" name="firmware" />
			</td>
		</tr>
		<tr>
			<td />
			<td>
				<div style="display: none; font-size: 14pt; font-weight: bold;" id="status_text" />&nbsp;</div>
				<input id="form_submit" type="submit" name="submit" value="@TR<<Upgrade>>" onClick="statusupdate()" />
			</td>
		</tr>
	</tbody>
	</table>
	</form>
EOF
}
equal "$REQUEST_METHOD" "POST" && {
	equal "${CONTENT_TYPE%%;*}" "multipart/form-data" || ERR=1
	BOUNDARY="${CONTENT_TYPE##*boundary=}"
	empty "$BOUNDARY" && ERR=1

	empty "$ERR" || {
		echo "Wrong data format"
		footer
		exit
	}
cat <<EOF
	<div style="margin: auto; text-align: left">
<pre>
EOF
	while :; do
		read_var
		empty "$NAME" && exit
		case "$NAME" in
			erase_fs)
				ERASE_FS=1
				bstrip "$BOUNDARY" > /dev/null
			;;
			erase_nvram)
				ERASE_NVRAM=1
				bstrip "$BOUNDARY" > /dev/null
			;;
			firmware) do_upgrade;;
		esac
	done
cat <<EOF
	</div>
EOF
}

footer

##WEBIF:name:System:4:Firmware Upgrade
