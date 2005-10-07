libdir=/usr/lib/webif
wwwdir=/www
cgidir=/www/cgi-bin/webif
rootdir=/cgi-bin/webif
indexpage=index.sh

categories() {
	grep '##WEBIF:' $cgidir/.categories $cgidir/*.sh 2>/dev/null | awk -F: '
	BEGIN {
		n = 0
		sel = 0
	}
	($3 == "category") && (categories !~ /:$4:/) {
		categories = categories ":" $4 ":";
	 	n++
		if ($4 ~ /^'"$1"'$/) sel = n
		c[n] = $4
		if (f[$4] == "") f[$4] = "'"$rootdir/$indexpage"'?cat=" $4
	}
	($3 == "name") && ((n[$4] == 0) || (n[$4] > int($5))) {
		gsub(/^.*\//, "", $1);
		n[$4] = int($5)
		f[$4] = "'"$rootdir"'/" $1
	}
	END {
		print "<div id=\"mainmenu\"><h3><strong>Categories:</strong></h3><ul>"
		
		for (i = 1; i <= n; i++) {
			if (sel == i) print "<li class=\"selected-maincat\"><a href=\"" f[c[i]] "\">&raquo;" c[i] "&laquo;</a></li>"
			else print "<li><a href=\"" f[c[i]] "\">&nbsp;" c[i] "&nbsp;</a></li>";
		}
	  
		print "</ul></div>"
	}' -
}

subcategories() {
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

update_changes() {
	CHANGES=$(($( (cat /tmp/.webif/config-* ; ls /tmp/.webif/file-*) 2>&- | wc -l)))
}

header() {
	ERROR=${ERROR:+<h3>$ERROR</h3><br /><br />}
	SAVED=${SAVED:+: Settings saved}
	_category="$1"
	_uptime="$(uptime)"
	_loadavg="${_uptime#*load average: }"
	_uptime="${_uptime#*up }"
	_uptime="${_uptime%%,*}"
	_hostname=$(cat /proc/sys/kernel/hostname)
	_version=$(cat /etc/banner | grep "(")
	_version="${_version%% ---*}"
	_saved_title=${ERROR:+: Settings not saved}
	_saved_title=${_saved_title:-$SAVED}
	_head="${3:+<div class=\"settings-block-title\"><h2>$3$_saved_title</h2></div>}"
	_form="${5:+<form enctype=\"multipart/form-data\" action=\"$5\" method=\"post\">}"
	_savebutton="${5:+<p><input type=\"submit\" name=\"action\" value=\"Save changes\" /></p>}"
	_categories=$(categories $1)
	_subcategories=${2:+$(subcategories $1 $2)}

	update_changes
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
						<li><strong>Hostname:</strong> $_hostname</li>
						<li><strong>Uptime:</strong> $_uptime</li>
						<li><strong>Load:</strong> $_loadavg</li>
						<li><strong>Version:</strong> $_version</li>
					</ul>
				</div>
			</div>
			$_categories
			$_subcategories
		</div>
		$_form
		<div id="content">
			<div class="settings-block">
				$_head
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
	_changes=${CHANGES#0}
	_changes=${_changes:+(${_changes})}
	cat <<EOF
			</div>
			<hr width="40%" />
		</div>
		<br />
		<div id="save">
			<div class="page-save">
				<div>
					$_savebutton
				</div>
			</div>
			<div class="apply">
				<div>
					<a href="config.sh?mode=save&amp;cat=$_category">Apply changes &laquo;</a><br />
					<a href="config.sh?mode=clear&amp;cat=$_category">Clear changes &laquo;</a><br />
					<a href="config.sh?mode=review&amp;cat=$_category">Review changes $_changes &laquo;</a>
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

list_remove() {
	echo "$1 " | awk '
BEGIN {
	RS=" "
	FS=":"
}
($0 !~ /^'"$2"'/) && ($0 != "") {
	printf " " $0
	first = 0
}'
}

handle_list() {
	_new="${1:+$(list_remove "$LISTVAL" "$1") }"
	_new="${_new:-$LISTVAL}"
	LISTVAL="$_new"
	LISTVAL="${LISTVAL# }"
	LISTVAL="${LISTVAL%% }"
	
	_validate="$4"
	_validate="${4:-none}"
	_changed="$1"
	[ \! -z "$3" ] && validate "$_validate|$2" && {
		LISTVAL="$LISTVAL $2"
		_changed="$1$3"
	}

	_return="${_changed:+0}"
	_return="${_return:-255}"
	LISTVAL="${LISTVAL# }"
	LISTVAL="${LISTVAL%% }"
	LISTVAL="${LISTVAL:- }"
	return $_return
}

load_settings() {
	[ \! "$1" = "nvram" -a -f /etc/config/$1 ] && . /etc/config/$1
	[ -f /tmp/.webif/config-$1 ] && . /tmp/.webif/config-$1
}

validate() {
	eval "$(echo "$1" | awk -f /usr/lib/webif/validate.awk)"
}

save_setting() {
	mkdir -p /tmp/.webif
	oldval=$(eval "echo \${$2}")
	oldval=${oldval:-$(nvram get "$2")}
	grep "^$2=" /tmp/.webif/config-$1 >&- 2>&- && {
		mv /tmp/.webif/config-$1 /tmp/.webif/config-$1-old 2>&- >&-
		grep -v "^$2=" /tmp/.webif/config-$1-old > /tmp/.webif/config-$1 2>&- 
		oldval=""
	}
	[ "$oldval" != "$3" ] && echo "$2=\"$3\"" >> /tmp/.webif/config-$1
	rm -f /tmp/.webif/config-$1-old
}


# common awk code for forms
AWK_START_FORM='
	print "<div class=\"settings\">"
	print "<div class=\"settings-title\"><h3><strong>" title "</strong></h3></div>"
	print "<div class=\"settings-content\">"
'
AWK_END_FORM='
	print "</div>"
	if (form_help != "") form_help = "<dl>" form_help "</dl>"
	print "<div class=\"settings-help\"><blockquote><h3><strong>Short help:</strong></h3>" form_help form_help_link "</blockquote></div>"
	form_help = ""
	form_help_link = ""
	print "<div style=\"clear: both\">&nbsp;</div></div>"
'

