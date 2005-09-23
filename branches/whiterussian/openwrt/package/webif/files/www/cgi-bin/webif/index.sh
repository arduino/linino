#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
category=$FORM_cat
[ -z "$category" ] && category=Info
header $category 1
?>
<? footer ?>
