#!/usr/bin/webif-page
<? 
. /usr/lib/webif/webif.sh

empty "$FORM_submit" || {
	SAVED=1
	validate <<EOF
string|FORM_pw1|Password|required min=5|$FORM_pw1
EOF
	equal "$FORM_pw1" "$FORM_pw2" || {
		ERROR="$ERROR Passwords do not match<br />"
	}
	empty "$ERROR" && {
		RES=$(
			(
				echo "$FORM_pw1"
				sleep 1
				echo "$FORM_pw2"
			) | passwd root 2>&1
		)
		equal "$?" 0 || ERROR="<pre>$RES</pre>"
	}
}

header "System" "Password" "@TR<<Password Change>>" '' "$SCRIPT_NAME"

display_form <<EOF
start_form|@TR<<Password Change>>
field|@TR<<New Password>>:
password|pw1
field|@TR<<Confirm Password>>:
password|pw2
end_form
EOF

footer ?>

<!--
##WEBIF:name:System:0:Password
-->
