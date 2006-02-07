function start_form(title, field_opts) {
	print "<div class=\"settings\"" field_opts ">"
	if (title != "") print "<div class=\"settings-title\"><h3><strong>" title "</strong></h3></div>"
	print "<div class=\"settings-content\">"
}

function end_form(form_help, form_help_link) {
	print "</div>"
	if (form_help != "") form_help = "<dl>" form_help "</dl>"
	print "<div class=\"settings-help\"><blockquote><h3><strong>@TR<<Short help>>:</strong></h3>" form_help form_help_link "</blockquote></div>"
	print "<div style=\"clear: both\">&nbsp;</div></div>"
}

function textinput(name, value) {
	return "<input type=\"text\" name=\"" name "\" value=\"" value "\" />"
}

function button(name, caption) {
	return "<input type=\"submit\" name=\"" name "\" value=\"@TR<<" caption ">>\" />"
}

function sel_option(name, caption, default, sel) {
	if (default == name) sel = " selected=\"selected\""
	else sel = ""
	return "<option value=\"" name "\"" sel ">" caption "</option>"
}
