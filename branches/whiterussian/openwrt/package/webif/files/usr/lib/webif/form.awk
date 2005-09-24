# $1 = type
# $2 = form variable name
# $3 = form variable value
# $4 = (radio button) value of button
# $5 = string to append
# $6 = additional attributes 

# trim leading whitespaces 
{
	gsub(/^[ \t]+/,"",$1)
}

$1 ~ /^start_form/ {
	print "<form method=\"POST\" action=\"" $2 "\" enctype=\"multipart/form-data\">"
	print "<input type=\"hidden\" name=\"submit\" value=\"1\" />"
	print "<table style=\"width: 90%; text-align: left;\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\" align=\"center\">"
	print "<tbody>"
}
$1 ~ /^field/ {
	if (field_open == 1) print "</td></tr>"
	if ($3 != "") field_id=" id=\"" $3 "\""
	else field_id=""
	print "<tr" field_id "><td>" $2 "</td><td>"
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
$1 ~ /^text/ {
	print "<input id=\"" $2 "\" type=\"text\" name=\"" $2 "\" value=\"" $3 "\" />" $4
}
$1 ~ /^submit/ {
	print "<input type=\"submit\" name=\"" $2 "\" value=\"" $3 "\" />"
}
{
	print $5
}
$1 ~ /^end_form/ {
	if (field_open == 1) print "</td></tr>"
	field_open = 0
	print "</tbody>"
	print "</table>"
	print "</form>"
}
END {
	if(field_open == 1) print "</td></tr>"
}
