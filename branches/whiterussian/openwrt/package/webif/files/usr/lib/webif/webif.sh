libdir=/usr/lib/webif
wwwdir=/www
cgidir=/www/cgi-bin/webif
indexpage=index.sh

header() {
  UPTIME=$(uptime)
  UPTIME="up ${UPTIME##*up}"
  HOSTNAME=$(cat /proc/sys/kernel/hostname)
  CHANGES=$(($(cat /tmp/.webif/config-* 2>&- | wc -l)))
  CHANGES=${CHANGES#0}
  CHANGES=${CHANGES:+( ${CHANGES} )}
  cat <<EOF
Content-Type: text/html
Pragma: no-cache

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en-US">
  <head>
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=ISO-8859-15" />
	<link rel="stylesheet" type="text/css" href="/webif.css" media="screen, tv, projection" title="Default" />
	<title>OpenWrt Administrative Console</title>
  </head>
  <body $4>
  <div id="container">
	<div id="header">
	  <div class="topHeader">&nbsp;</div>
	  <div class="midHeader">
		<h1 class="headerTitle">OpenWrt Admin Console</h1>
		<div class="headerSubTitle">$UPTIME</div>
		<br class="doNotDisplay doNotPrint" />
		<div class="headerInfo">
		  <span>Hostname: &nbsp;</span>
		  $HOSTNAME
		</div>
		<div class="headerLinks">
		  <a href="config.sh?mode=save&cat=$1">Apply settings &laquo;</a>
		  <a href="config.sh?mode=clear&cat=$1">Clear changes &laquo;</a>
		  <a href="config.sh?mode=review&cat=$1">Review changes $CHANGES &laquo;</a>
		</div>
	  </div>
	  <div class="doNotDisplay doNotPrint">
		  <br />
		  <br />
		  <br />
	  </div>
EOF
  grep '##WEBIF:category' $cgidir/.categories $cgidir/*.sh 2>/dev/null | awk -F: '
	BEGIN {
	  print "<div class=\"categoryHeader\"><span>Categories: &nbsp;&nbsp;&nbsp; </span>"
	}
	categories !~ /:$4:/ {
	  categories = categories ":" $4 ":";
	  if ($4 ~ /^'"$1"'$/) print "<a class=\"active\">&raquo;" $4 "&laquo;</a> &nbsp;"
	  else print "<a href=\"'"$indexpage"'?cat=" $4 "\">&nbsp;" $4 "&nbsp;</a> &nbsp;";
	}
	END {
	  print "</div>"
	}' -
	[ \! -z "$2" ] && {
	  grep "##WEBIF:name:$1:" *.sh 2>/dev/null | sed -e 's,^\([a-zA-Z\.\-]*\):\(.*\)$,\2:\1,' | sort -n | awk -F: '
		BEGIN {
		  print "<div class=\"subHeader\"><span class=\"doNotDisplay doNotPrint\">Config pages: &nbsp;</span>";
		}
		{
		  if ($5 ~ /^'"$2"'$/) print "<a class=\"active\">&raquo;" $5 "&laquo;</a>&nbsp;&nbsp;&nbsp;"
		  else print "<a href=\"" $6 "\">" $5 "</a>&nbsp;&nbsp;&nbsp;";
		}
		END {
		  print "</div>";
		}
	  ' -
	}
	[ -z "$3" ] && HEAD="" || HEAD="<h1>$3</h1><br />" 
	cat <<EOF
	</div>
	<div id="main-copy">
	  <div class="rowOfBoxes">
		<div class="noBorderOnLeft">
		$HEAD
EOF
	[ -z "$REMOTE_USER" \
	  -a "${SCRIPT_NAME#/cgi-bin/webif/}" != "info.sh"\
	  -a "${SCRIPT_NAME#/cgi-bin/webif/}" != "about.sh" ] && {
		[ -z $FORM_passwd1 ] || {
			echo '<pre>'
			(
				echo "$FORM_passwd1"
				sleep 1
				echo "$FORM_passwd2"
			) | passwd root
			apply_passwd
			echo '</pre>'
			footer
			exit
		}
		grep 'root:!' /etc/passwd >&- 2>&- && {
			cat <<EOF
<br />
<br />
<br />
<h3>Warning: you haven't set a password for the Web interface and SSH access<br />
Please enter one now</h3>
<br />
<form enctype="multipart/form-data" action="$SCRIPT_NAME" method="POST">
<table>
	<tr>
		<td>Enter Password:</td>
		<td><input type="password" name="passwd1" /></td>
	</tr>
	<tr>
		<td>Repeat Password: &nbsp; </td>
		<td><input type="password" name="passwd2" /></td>
	</tr>
	<tr>
		<td />
		<td><input type="submit" name="action" value="Set" /></td>
	</tr>
</table>
</form>
EOF
			footer
			exit
		} || {
			apply_passwd
		}
	}
}

footer() {
  cat <<EOF
	<br />
	</div> </div> </div>
	<div id="footer">
OpenWrt Administrative Console
	</div>
	</div>
  </body>
</html>
EOF
}

apply_passwd() {
	case ${SERVER_SOFTWARE%% *} in
		busybox)
			echo -n '/:' > /etc/httpd.conf
			cat /etc/passwd | grep root | cut -d: -f1,2 >> /etc/httpd.conf
			echo '/cgi-bin/webif/info.sh:*' >> /etc/httpd.conf
			echo '/cgi-bin/webif/about.sh:*' >> /etc/httpd.conf
			killall -HUP httpd
			;;
	esac
}

display_form() {
	echo "$1" | awk -F: -f /usr/lib/webif/form.awk
}

mkdir -p /tmp/.webif

load_settings() {
	[ \! "$1" = "nvram" -a -f /etc/config/$1 ] && . /etc/config/$1
	[ -f /tmp/.webif/config-$1 ] && . /tmp/.webif/config-$1 
}

validate_ip() {
	[ \! -z "$1" ] && {
		ipcalc "$1" >&- 2>&- && return 0 || {
			ERROR="$ERROR Invalid IP address: $2<br />"
			return 255
		}
	} || {
		[ "$3" != "1" ] && return 0 || {
			ERROR="$ERROR No IP address entered: $2<br />"
			return 255
		} 
	}
}

validate_ips() {
	[ \! -z "$1" ] && {
		invalid_ip=0
		for tmp_ip in $1; do
			ipcalc "$1" >&- 2>&- || invalid_ip=1
		done
		[ "$invalid_ip" != 1 ] && return 0 || {
			ERROR="$ERROR Invalid IP address list: $2<br />"
			return 255
		}
	} || {
		[ "$3" != "1" ] && return 0 || {
			ERROR="$ERROR No IP address entered: $2<br />"
			return 255
		} 
	}
}

validate_netmask() {
	[ \! -z "$1" ] && {
		# FIXME
		ipcalc "$1" >&- 2>&- && return 0 || {
			ERROR="$ERROR Invalid Netmask: $2<br />"
			return 255
		}
	} || {
		[ "$3" != "1" ] && return 0 || {
			ERROR="$ERROR No Netmask entered: $2<br />"
			return 255
		} 
	}
}

save_setting() {
	oldval=$(eval "echo \${$2}")
	oldval=${oldval:-$(nvram get "$2")}
	[ "$oldval" != "$3" ] && echo "$2=\"$3\"" >> /tmp/.webif/config-$1
}
