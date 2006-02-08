#!/usr/bin/webif-page -u
<? 
. /usr/lib/webif/webif.sh
header "System" "Firmware Upgrade" "@TR<<Firmware Upgrade>>"

strip_cybertan() {
	(
		dd of=/dev/null bs=32 count=1 2>/dev/null
		cat > /tmp/upgrade.bin
	) < "$FORM_firmware"
	rm "$FORM_firmware"
}

empty "$FORM_submit" || empty "$FORM_firmware" || {
	exists $FORM_firmware && {
		HEADER=$(head -c4 $FORM_firmware | hexdump -e "8/1 \"%x\"")
		grep BCM947 /proc/cpuinfo > /dev/null && {
			case "$HEADER" in
				48445230) # TRX
					echo "@TR<<Firmware format>>: TRX<br />"
					mv $FORM_firmware /tmp/upgrade.bin
					UPGRADE=1
				;;
				57353447|57353453|57353473) # WRT54G(S)
					echo "@TR<<Firmware format>>: Cybertan BIN =&lt; @TR<<converting...>> "
					strip_cybertan
					echo "@TR<<done>>. <br />"
					UPGRADE=1
				;;
				*)
					rm $FORM_firmware
					ERROR="<h2>@TR<<Error>>: @TR<<Invalid_format|Invalid firmware file format>></h2>"
				;;
			esac
		}
	} || {
		ERROR="<h2>@TR<<Error>>: @TR<<Open_failed|Couldn't open firmware file>></h2>"
	}
}
?>
<?if empty "$UPGRADE" ?>
	<form method="POST" name="upgrade" action="<? echo -n $SCRIPT_NAME ?>" enctype="multipart/form-data">
	<table style="width: 90%; text-align: left;" border="0" cellpadding="2" cellspacing="2" align="center">
	<tbody>
		<tr>
			<td>@TR<<Options>>:</td>
			<td>
				<input type="checkbox" name="erase_fs" value="1" checked="checked" />@TR<<Erase_JFFS2|Erase JFFS2 partition>><br />
				<input type="checkbox" name="erase_nvram" value="1" />@TR<<Erase NVRAM>>
			</td>
		</tr>
		<tr>
			<td>@TR<<Firmware_image|Firmware image to upload:>></td>
			<td>
				<input type="file" name="firmware" />
			</td>
		</tr>
			<td />
			<td><input type="submit" name="submit" value="@TR<<Upgrade>>" /></td>
		</tr>
	</tbody>
	</table>
	</form>
<?el?>
<?
	ERASE="${FORM_erase_fs:+-e linux }"
	ERASE="$ERASE${FORM_erase_nvram:+-e nvram }"
	cp /bin/busybox /tmp/
	echo -n '@TR<<Upgrading...>> '
	# FIXME: probably a race condition (with the reboot), but it seems to work
	mtd -r $ERASE write /tmp/upgrade.bin linux 2>&- | awk 'END { print "@TR<<done>>." }'
	exit
?>
<?fi?>

<? footer ?>
<!--
##WEBIF:name:System:4:Firmware Upgrade
-->
