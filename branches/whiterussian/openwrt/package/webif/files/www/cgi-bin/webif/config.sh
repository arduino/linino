#!/usr/bin/haserl
<? 
. /usr/lib/webif/webif.sh
[ "$FORM_mode" = "clear" ] && rm -rf /tmp/.webif >&- 2>&- 
header $FORM_cat .
?>

<?if [ "$FORM_mode" = "clear" ] ?>
	<h2>All configuration changes have been cleared.</h2>
<?el?>
	<?if grep = /tmp/.webif/config-* >&- 2>&- ?>
		<?if [ "$FORM_mode" = "save" ] ?>
			<h2>Updating configuration...</h2>
			<br />
			<pre><? sh /usr/lib/webif/apply.sh ?></pre>
			<h2>Done</h2>
		<?fi?>
	
		<?if [ "$FORM_mode" = "review" ] ?>
			<h2>Configuration changes:</h2>
	<? (
	cd /tmp/.webif
	for configname in config-*; do
		echo -n "<h3>${configname#config-}</h3><pre>"
		cat $configname
		echo '</pre>'
	done
	) ?>
		<?fi?>
		
	<?el?>
		<h2>No configuration changes were made.</h2>
	<?fi?>
<?fi?>


<? footer ?>
