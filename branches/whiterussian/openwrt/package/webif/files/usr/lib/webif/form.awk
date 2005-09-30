# $1 = type
# $2 = form variable name
# $3 = form variable value
# $4 = (radio button) value of button
# $5 = string to append
# $6 = additional attributes 

BEGIN {
	FS="|"
	print "<input type=\"hidden\" name=\"submit\" value=\"1\" />"
}

# trim leading whitespaces 
{
	gsub(/^[ \t]+/,"",$1)
}

($1 != "") && ($1 !~ /^option/) {
	select_open = 0
	print "</select>"
}
$1 ~ /^start_form/ {
	if ($3 != "") field_opts=" id=\"" $3 "\""
	else field_opts=""
	if ($4 == "hidden") field_opts = field_opts " style=\"display: none\""
	print "<div class=\"settings\"" field_opts ">"
	if ($2 != "") print "<div class=\"settings-title\"><h3><strong>" $2 "</strong></h3></div>"
	print "<div class=\"settings-content\"><table width=\"100%\" summary=\"Settings\">"
	form_help = ""
	form_help_link = ""
}
$1 ~ /^field/ {
	if (field_open == 1) print "</td></tr>"
	if ($3 != "") field_opts=" id=\"" $3 "\""
	else field_opts=""
	if ($4 == "hidden") field_opts = field_opts " style=\"display: none\""
	print "<tr" field_opts "><td width=\"45%\">" $2 "</td><td width=\"55%\">"
	field_open=1
}
$1 ~ /^checkbox/ {
	if ($3==$4) checkbox_selected="checked=\"checked\" "
	else checkbox_selected=""
	print "<input id=\"" $2 "_" $4 "\" type=\"checkbox\" name=\"" $2 "\" value=\"" $4 "\" " checkbox_selected $6 " />"
}
$1 ~ /^radio/ {
	if ($3==$4) radio_selected="checked=\"checked\" "
	else radio_selected=""
	print "<input id=\"" $2 "_" $4 "\" type=\"radio\" name=\"" $2 "\" value=\"" $4 "\" " radio_selected $6 " />"
}
$1 ~ /^select/ {
	print "<select id=\"" $2 "\" name=\"" $2 "\">"
	select_open = 1
	select_default = $3
}
($1 ~ /^option/) && (select_open == 1) {
	if ($2 == select_default) option_selected=" selected=\"selected\""
	else option_selected=""
	if ($3 != "") option_title = $3
	else option_title = $2
	print "<option" option_selected " value=\"" $2 "\">" option_title "</option>"
}
$1 ~ /^text/ { print "<input id=\"" $2 "\" type=\"text\" name=\"" $2 "\" value=\"" $3 "\" />" $4 }
$1 ~ /^submit/ { print "<input type=\"submit\" name=\"" $2 "\" value=\"" $3 "\" />" }
$1 ~ /^helpitem/ { form_help = form_help "<dt>" $2 ":</dt>" }
$1 ~ /^helptext/ { form_help = form_help "<dd>" $2 "</dd>" }
$1 ~ /^helplink/ { form_help_link = "<div class=\"more-help\"><a href=\"" $2 "\">more...</a></div>" }

{
	print $5
}

$1 ~ /^end_form/ {
	if (field_open == 1) print "</td></tr>"
	field_open = 0
	print "</table></div>"
	if (form_help != "") form_help = "<dl>" form_help "</dl>"
	print "<div class=\"settings-help\"><blockquote><h3><strong>Short help:</strong></h3>" form_help form_help_link "</blockquote></div>"
	form_help = ""
	print "<div style=\"clear: both\">&nbsp;</div></div>"
}
