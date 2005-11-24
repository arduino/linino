BEGIN {
	FS=":"
	print "<div id=\"submenu\"><h3><strong>Sub-Categories:</strong></h3><ul>"
}
{
	if ($5 ~ "^" selected "$") print "<li class=\"selected-maincat\"><a href=\"" rootdir "/" $6 "\">&raquo;" $5 "&laquo;</a></li>"
	else print "<li><a href=\"" rootdir "/" $6 "\">&nbsp;" $5 "&nbsp;</a></li>"
}
END {
	print "</ul></div>"
}

