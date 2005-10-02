#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh

case "$CHANGES" in
	""|0)FORM_mode=nochange
esac
case "$FORM_mode" in 
	nochange) header $FORM_cat . "Configuration: no changes were made.";;
	clear)
		rm -rf /tmp/.webif >&- 2>&- 
		header $FORM_cat . "Configuration: cleared."
		CHANGES=""
		;;
	review)
		header $FORM_cat . "Configuration changes:"
		cd /tmp/.webif
		for configname in config-*; do
			grep = $configname >&- 2>&- && {
				echo -n "<h3>${configname#config-}</h3><br /><pre>"
				cat $configname
				echo '</pre><br />'
			}
		done
		CONFIGFILES=""
		for configname in $(ls file-* 2>&-); do
			CONFIGFILES="$CONFIGFILES ${configname#file-}"
		done
		CONFIGFILES="${CONFIGFILES:+<h3 style="display:inline">Config files: </h3>$CONFIGFILES<br />}"
		echo $CONFIGFILES
		;;
	save)
		header $FORM_cat . "Configuration: updating..."
		CHANGES=""
		echo '<pre>'
		sh /usr/lib/webif/apply.sh
		echo '</pre>'
		;;
esac

footer

?>
