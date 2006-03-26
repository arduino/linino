#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh

mkdir -p /tmp/.webif
exists /tmp/.webif/file-firewall && FW_FILE=/tmp/.webif/file-firewall || FW_FILE=/etc/config/firewall
exists "$FW_FILE" || touch "$FW_FILE" >&- 2>&-
FW_FILE_NEW="/tmp/.webif/file-firewall-new"

empty "$FORM_cancel" || {
	FORM_save=""
	FORM_edit=""
}

empty "$FORM_save" || {
	SAVED=1
	case "$FORM_proto" in
		tcp|udp|"") proto_valid=1;;
		*) proto_valid=invalid;;
	esac
	validate <<EOF
int|proto_valid|@TR<<Protocol>>||$proto_valid
string|FORM_target|@TR<<Target>>|required|$FORM_target
string|FORM_proto|@TR<<Protocol>>||$FORM_proto
ip|FORM_src|@TR<<Source IP>>||$FORM_src
ip|FORM_dest|@TR<<Destination IP>>||$FORM_dest
ports|FORM_sport|@TR<<Source Ports>>||$FORM_sport
ports|FORM_dport|@TR<<Destination Ports>>||$FORM_dport
ip|FORM_target_ip|@TR<<Forward to>>||$FORM_target_ip
port|FORM_target_port|@TR<<Port>>||$FORM_target_port
EOF
	equal "$?" 0 || {
		unset FORM_save
	}
	equal "$FORM_target" "forward" && empty "$FORM_target_ip$FORM_target_port" && {
		ERROR="${ERROR}@TR<<No_Target_IP_Port|Target IP and Port cannot both be empty>><br />"
		FORM_save=""
	}
}

empty "$FORM_up$FORM_down$FORM_save$FORM_delete$FORM_new" || {
	empty "$FORM_up" || equal "$FORM_up" 1 || {
		FORM_down="$(($FORM_up - 1))"
	}
	awk \
		-v down="$FORM_down" \
		-v save="$FORM_save" \
		-v del="$FORM_delete" \
		-v edit="$FORM_edit" \
		-v proto="$FORM_proto" \
		-v src="$FORM_src" \
		-v sport="$FORM_sport" \
		-v dest="$FORM_dest" \
		-v dport="$FORM_dport" \
		-v layer7="$FORM_layer7" \
		-v target="$FORM_target" \
		-v target_ip="$FORM_target_ip" \
		-v target_port="$FORM_target_port" \
		-v new="$FORM_new" \
		-v new_target="$FORM_new_target" \
		-f - "$FW_FILE" > "$FW_FILE_NEW" <<EOF
BEGIN {
	FS=":"
}

function addnew(new) {
	new = target ":";
	if (proto != "") new = new "proto=" proto " "
	if (src != "") new = new "src=" src " "
	if (dest != "") new = new "dest=" dest " "
	if (sport != "") new = new "sport=" sport " "
	if (dport != "") new = new "dport=" dport " "
	if (layer7 != "") new = new "layer7=" layer7 " "
	gsub(/ $/, "", new);
	if (target == "forward") {
		new = new ":" target_ip
		if (target_port != "") new = new ":" target_port
	}
	print new
}

(\$1 == "drop") || (\$1 == "accept") || (\$1 == "forward" ) {
	n++
	if (noprint == 1) {
		noprint = 0
	}
	if (down == n) {
		line_down = \$0
		noprint = 1
	}
	if (del == n) {
		noprint = 1
	}
	if (edit == n) {
		if ((target == "forward") && (target == \$1)) {
			noprint = 1
		}
		if ((\$1 != "forward") && ((target == "accept") || (target == "drop"))) {
			noprint = 1
		}
		if (noprint == 1) {
			addnew()
		}
	}
}

{
	if ((\$1 == "drop") || (\$1 == "accept") || (\$1 == "forward" )) {
		if (noprint != 1) print \$0
	} else {
		print \$0
	}
}

(line_down != "") && (n > down) {
	print line_down
	line_down = ""
}

END {
	if (line_down != "") print line_down
	if (new_target == "forward") new_target = new_target "::192.168.1.1"
	if ((new != "") && (new_target != "")) print new_target
}
EOF
	FW_FILE=/tmp/.webif/file-firewall
	mv "$FW_FILE_NEW" "$FW_FILE"
	empty "$FORM_new" && FORM_edit=""
}

header "Network" "Firewall" "@TR<<Firewall Configuration>>" ''

?>
<style>
td.edit_title {
	font-weight: bold;
	text-align: right;
	padding-top: 0.8em;
	padding-right: 0.5em;
	padding-bottom: auto;
}
td.match_title {
	width: 10em;
	text-align: right;
	padding-top: 0.8em;
	padding-right: 0.5em;
	padding-bottom: auto;
}
</style>
<?

awk \
	-v edit="$FORM_edit" \
	-v save="$FORM_save" \
	-v proto="$FORM_proto" \
	-v src="$FORM_src" \
	-v sport="$FORM_sport" \
	-v dest="$FORM_dest" \
	-v dport="$FORM_dport" \
	-v layer7="$FORM_layer7" \
	-v target="$FORM_target" \
	-v target_ip="$FORM_target_ip" \
	-v target_port="$FORM_target_port" \
	-v del_proto="$FORM_del_proto" \
	-v del_src="$FORM_del_src" \
	-v del_sport="$FORM_del_sport" \
	-v del_dest="$FORM_del_dest" \
	-v del_dport="$FORM_del_dport" \
	-v del_layer7="$FORM_del_layer7" \
	-v data_submit="$FORM_data_submit" \
	-v new_match="$FORM_new_match" \
	-f /usr/lib/webif/common.awk \
	-f /usr/lib/common.awk \
	-f - "$FW_FILE" <<EOF
function set_data() {
	_l["proto"] = proto
	_l["src"] = src
	_l["sport"] = sport
	_l["dest"] = dest
	_l["dport"] = dport
	_l["layer7"] = layer7
	
	if (del_proto != "") _l["proto"] = ""
	if (del_src != "") _l["src"] = ""
	if (del_sport != "") _l["sport"] = ""
	if (del_dest != "") _l["dest"] = ""
	if (del_dport != "") _l["dport"] = ""
	if (del_layer7 != "") _l["layer7"] = ""
}
function iptstr2web(str, ret) {
	ret = ""
	str2data(str);
	if (_l["proto"] != "") ret = ret "@TR<<Protocol>>: " _l["proto"] "<br />"
	if (_l["src"] != "") ret = ret "@TR<<Source IP>>: " _l["src"] "<br />"
	if (_l["sport"] != "") ret = ret "@TR<<Source Ports>>: " _l["sport"] "<br />"
	if (_l["dest"] != "") ret = ret "@TR<<Destination IP>>: " _l["dest"] "<br />"
	if (_l["dport"] != "") ret = ret "@TR<<Destination Ports>>: " _l["dport"] "<br />"
#	if (_l["layer7"] != "") ret = ret "@TR<<Application Protocol>>: " _l["layer7"] "<br />"
	if (ret == "") ret = ret "@TR<<Everything>>"
	return ret
}
function delbutton(name) {
	return button("del_" name, "Delete")
}
function input_line(caption, name, value) {
	return "<tr><td class=\\"match_title\\">@TR<<" caption ">>: </td><td>" textinput(name, value) delbutton(name) "</td></tr>"
}
function iptstr2edit(str, edit) {
	edit = ""
	str2data(str);
	if (int(data_submit) == 1) set_data()
	if (new_match == "proto") _l["proto"] = "tcp"
	if ((new_match == "src") || (new_match == "dest")) _l[new_match] = "0.0.0.0"
	if ((new_match == "sport") || (new_match == "dport")) _l[new_match] = "0"
	if ((new_match != "") && (_l[new_match] == "")) _l[new_match] = " "
	
	if (_l["proto"] != "") {
		edit = edit "<tr><td class=\\"match_title\\">@TR<<Protocol>>: </td><td>"
		edit = edit "<select name=\\"proto\\">"
		edit = edit sel_option("tcp", "TCP", _l["proto"])
		edit = edit sel_option("udp", "UDP", _l["proto"])
		edit = edit "</select>" delbutton("proto")
		edit = edit "</td></tr>"
	}
	if (_l["src"] != "") edit = edit input_line("Source IP", "src", _l["src"])
	if (_l["sport"] != "") edit = edit input_line("Source Ports", "sport", _l["sport"])
	if (_l["dest"] != "") edit = edit input_line("Destination IP", "dest", _l["dest"])
	if (_l["dport"] != "") edit = edit input_line("Destination Ports", "dport", _l["dport"])
	if (_l["layer7"] != "") edit = edit input_line("Application Protocol", "layer7", _l["layer7"])

	edit = edit "<tr><td class=\\"match_title\\">&nbsp;</td><td><select name=\\"new_match\\">"
	edit = edit sel_option("none", "---")
	if (_l["proto"] == "") edit = edit sel_option("proto", "Protocol")
	if (_l["src"] == "") edit = edit sel_option("src", "Source IP")
	if (_l["dest"] == "") edit = edit sel_option("dest", "Destination IP")
	if ((_l["proto"] == "tcp") || (_l["proto"] == "udp") || (_l["proto"] == "")) {
		if (_l["sport"] == "") edit = edit sel_option("sport", "Source Ports")
		if (_l["dport"] == "") edit = edit sel_option("dport", "Destination Ports")
#		if (_l["layer7"] == "") edit = edit sel_option("layer7", "Application Protocol")
	}
	edit = edit "</select>"
	edit = edit button("add_match", "Add") "</td></tr>"

	return edit
}

BEGIN {
	print start_form("@TR<<Firewall Rules>>");
	print "<table width=\\"100%\\">"
	print "<tr><th>@TR<<Match>></th><th>@TR<<Target>></th><th>@TR<<Port>></th><th>&nbsp;</th></tr>"
	FS=":"
	n = 0
}

(\$1 == "drop") || (\$1 == "accept") || (\$1 == "forward" ) {
	n++
	print "<tr><td colspan=\\"5\\"><hr class=\\"separator\\" /></td></tr>"
	if (n == edit) {
		print "<form enctype=\\"multipart/form-data\\" method=\\"post\\" action=\\"$SCRIPT_NAME\\">"
		print hidden("data_submit", "1") hidden("edit", edit)
		print "<tr><td colspan=\\"5\\">"
		print "<table width=\\"100%\\">"
		print iptstr2edit(\$2)
		print "<tr><td><hr class=\\"separator\\" /></td><td>&nbsp;</td></tr>"
	} else {
		printf "<tr><td>" iptstr2web(\$2) "</td>"
	}
}

(\$1 == "drop") || (\$1 == "accept") {
	if (n == edit) {
		if (int(data_submit) == 1) \$1 = target
		printf "<tr>"
		printf "<td class=\\"edit_title\\">@TR<<Target>>:</td><td>"
		printf "<select name=\\"target\\">"
		printf sel_option("accept", "Accept", \$1)
		printf sel_option("drop", "Drop", \$1)
		printf "</td>"
		printf "</tr>"
	} else {
		printf "<td colspan=\\"2\\">" \$1 "</td>"
	}
}

\$1 == "forward" {
	if (n == edit) {
		if (target_ip == "") target_ip = \$3
		if (target_port == "") target_port = \$4
		print "<tr><td class=\\"edit_title\\">@TR<<Forward to>>:</b></td><td>" textinput("target_ip", target_ip) hidden("target", "forward") "</td></tr>"
		print "<tr><td class=\\"edit_title\\">@TR<<Port>>:</b></td><td>" textinput("target_port", target_port) "</td></tr>"
	} else {
		if (\$3 \$4 == "") \$3 = "forward"
		printf "<td>" \$3 "</td><td>" \$4 "</td>"
	}
}

(\$1 == "drop") || (\$1 == "accept") || (\$1 == "forward" ) {
	if (n == edit) {
		printf "<tr><td>&nbsp;</td><td>" button("save", "Save") button("cancel", "Cancel") "</td></tr>"
		
		print "</table>"
		print "</td></tr>"
		print "</form>"
	} else {
		printf "<td style=\\"text-align: right; padding-right: 0.5em\\">"
		printf "<a href=\\"$SCRIPT_NAME?up=" n "\\">@TR<<Up>></a><br />"
		printf "<a href=\\"$SCRIPT_NAME?down=" n "\\">@TR<<Down>></a>"
		printf "</td><td>"
		printf "<a href=\\"$SCRIPT_NAME?edit=" n "\\">@TR<<Edit>></a><br />"
		printf "<a href=\\"$SCRIPT_NAME?delete=" n "\\">@TR<<Delete>></a>"
		print "</td></tr>"
	}
}

END {
	print "<tr><td colspan=\\"5\\"><hr class=\\"separator\\" /></td></tr>"
	print "<tr><td class=\\"edit_title\\">@TR<<New Rule>>: </td><td colspan=\\"4\\">"
	print "<form method=\\"POST\\" action=\\"$SCRIPT_NAME\\" enctype=\\"multipart/form-data\\">"
	print hidden("edit", n + 1);
	print "<select name=\\"new_target\\">"
	print sel_option("forward", "Forward")
	print sel_option("accept", "Accept")
	print sel_option("drop", "Drop")
	print "</select>" button("new", "Add") "</form></td></tr>"
	print "</table>"
	print end_form("...");
}
EOF

footer ?>
<!--
##WEBIF:name:Network:9:Firewall
-->
