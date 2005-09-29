libdir=/usr/lib/webif
wwwdir=/www
cgidir=/www/cgi-bin/webif
rootdir=/cgi-bin/webif
indexpage=index.sh

header() {
  CATEGORY="$1"
  UPTIME="$(uptime)"
  LOADAVG="${UPTIME#*load average: }"
  UPTIME="${UPTIME#*up }"
  UPTIME="${UPTIME%%,*}"
  HOSTNAME=$(cat /proc/sys/kernel/hostname)
  VERSION=$(cat /etc/banner | grep "(")
  VERSION="${VERSION%% ---*}"
  cat <<EOF
Content-Type: text/html
Pragma: no-cache

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
    	<title>OpenWrt Administrative Console</title>
		<link rel="stylesheet" type="text/css" href="/webif.css" />
	</head>
	<body $4><div id="container">
	    <div id="header">
	        <div id="header-title">
				<div id="openwrt-title"><h1>OpenWrt Admin Console</h1></div>
				<div id="short-status">
					<h3><strong>Status:</strong></h3>
					<ul>
						<li><strong>Hostname:</strong> $HOSTNAME</li>
						<li><strong>Uptime:</strong> $UPTIME</li>
						<li><strong>Load:</strong> $LOADAVG</li>
						<li><strong>Version:</strong> $VERSION</li>
					</ul>
				</div>
			</div>
EOF
  grep '##WEBIF:category' $cgidir/.categories $cgidir/*.sh 2>/dev/null | awk -F: '
	BEGIN {
	  print "<div id=\"mainmenu\"><h3><strong>Categories:</strong></h3><ul>"
	}
	categories !~ /:$4:/ {
	  categories = categories ":" $4 ":";
	  if ($4 ~ /^'"$1"'$/) print "<li class=\"selected-maincat\"><a href=\"'"$rootdir/$indexpage"'?cat=" $4 "\">&raquo;" $4 "&laquo;</a></li>"
	  else print "<li><a href=\"'"$rootdir/$indexpage"'?cat=" $4 "\">&nbsp;" $4 "&nbsp;</a></li>";
	}
	END {
	  print "</ul></div>"
	}' -
	[ \! -z "$2" ] && {
	  grep -H "##WEBIF:name:$1:" $cgidir/*.sh 2>/dev/null | sed -e 's,^.*/\([a-zA-Z\.\-]*\):\(.*\)$,\2:\1,' | sort -n | awk -F: '
		BEGIN {
	      print "<div id=\"submenu\"><h3><strong>Sub-Categories:</strong></h3><ul>"
		}
		{
		  if ($5 ~ /^'"$2"'$/) print "<li class=\"selected-maincat\"><a href=\"'"$rootdir/"'" $6 "\">&raquo;" $5 "&laquo;</a></li>"
		  else print "<li><a href=\"'"$rootdir/"'" $6 "\">&nbsp;" $5 "&nbsp;</a></li>"
		}
		END {
	      print "</ul></div>"
		}
	  ' -
	}
	SAVED=${SAVED:+: Settings saved}
	SAVED_TITLE=${ERROR:+: Settings not saved}
	SAVED_TITLE=${SAVED_TITLE:-$SAVED}
	ERROR=${ERROR:+<h3>$ERROR</h3><br /><br />}
	HEAD="${3:+<div class=\"settings-block-title\"><h2>$3$SAVED_TITLE</h2></div>}"
	FORM="${5:+<form enctype=\"multipart/form-data\" action=\"$5\" method=\"post\">}"
	SAVEBUTTON="${5:+<p><input type=\"submit\" name=\"action\" value=\"Save changes\" /></p>}"
	cat <<EOF
		</div>
		$FORM
		<div id="content">
			<div class="settings-block">
				$HEAD
				$ERROR
EOF
	[ -z "$REMOTE_USER" \
	  -a "${SCRIPT_NAME#/cgi-bin/}" != "webif.sh" ] && {
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
  CHANGES=$(($(cat /tmp/.webif/config-* 2>&- | wc -l)))
  CHANGES=${CHANGES#0}
  CHANGES=${CHANGES:+(${CHANGES})}
  cat <<EOF
			</div>
			<hr width="40%" />
		</div>
		<br />
		<div id="save">
			<div class="page-save">
				<div>
					$SAVEBUTTON
				</div>
			</div>
			<div class="apply">
				<div>
					<a href="config.sh?mode=save&amp;cat=$CATEGORY">Apply changes &laquo;</a><br />
					<a href="config.sh?mode=clear&amp;cat=$CATEGORY">Clear changes &laquo;</a><br />
					<a href="config.sh?mode=review&amp;cat=$CATEGORY">Review changes $CHANGES &laquo;</a>
				</div>
			</div>
		</div>
		</form>
    </div></body>
</html>
EOF
}

apply_passwd() {
	case ${SERVER_SOFTWARE%% *} in
		busybox)
			echo -n '/cgi-bin/webif:' > /etc/httpd.conf
			cat /etc/passwd | grep root | cut -d: -f1,2 >> /etc/httpd.conf
			killall -HUP httpd
			;;
	esac
}

display_form() {
	echo "$1" | awk -F'|' -f /usr/lib/webif/form.awk
}

mkdir -p /tmp/.webif

load_settings() {
	[ \! "$1" = "nvram" -a -f /etc/config/$1 ] && . /etc/config/$1
	[ -f /tmp/.webif/config-$1 ] && . /tmp/.webif/config-$1 
}

validate() {
	eval "$(echo "$1" | awk -f /usr/lib/webif/validate.awk)"
	[ -z "$ERROR" ] && return 0 || return 255
}

save_setting() {
	oldval=$(eval "echo \${$2}")
	oldval=${oldval:-$(nvram get "$2")}
	mv /tmp/.webif/config-$1 /tmp/.webif/config-$1-old 2>&- >&-
	grep -v "^$2=" /tmp/.webif/config-$1-old > /tmp/.webif/config-$1 2>&-
	[ "$oldval" != "$3" ] && echo "$2=\"$3\"" >> /tmp/.webif/config-$1
	rm -f /tmp/.webif/config-$1-old
}
