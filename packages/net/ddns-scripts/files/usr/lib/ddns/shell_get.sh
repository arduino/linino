#######################################################################
#/usr/lib/ddns/shell_get.sh
#
# Written by Eric Bishop, January 2008
# Distributed under the terms of the GNU General Public License (GPL) version 2.0
#
# This implements a wget-like program ("shell_get 1.0") that can handle 
# basic http username/password authentication.
# It is implemented using the netcat (nc) utility. 
# This is necessary because the default busybox wget
# does not include username/password functionality (it really sucks)
##########################################################################

to_ascii()
{
	dec=$1
	hex=""
	if [ $dec -lt 26 ]; then
		hex=$(($dec + 0x41))
	elif [ $dec -ge 26 ] && [ $dec -lt 52 ]; then
		hex=$(( ($dec-26) + 0x61))
	elif [ $dec -ge 52 ] && [ $dec -lt 62 ]; then
		hex=$(( ($dec-52) + 0x30))
	elif [ $dec -eq 62 ]; then
		hex=43
	else
		hex=47
	fi
	printf "%x" $hex
}

encode_base64()
{
	original_str=$1
	
	hex_str=$( echo -n "$original_str" | hexdump -v -e '1/1 "%02x"' | awk ' { $0~gsub(/00$/, "") };{ i=1; while(i <= length($0) ){ block= substr($0, i, 3); printf("%s ", block); i=i+3;  }}' | awk ' {$0~gsub(/ $/, "")}; { print $0 }' )

	length=$(echo $hex_str | awk  '{$0~gsub(/ /, "")}; { print length($0) }')
	remainder=$(($length % 3 ))
	if [ $remainder -eq 1 ]; then
		hex_str=$hex_str'00'
	elif [ $remainder -eq 2 ]; then
		hex_str=$hex_str'0'
	fi




	base_64_str=""
	for hex_block in $hex_str
	do
		char1=$(to_ascii $((0x$hex_block / 64)))
		char2=$(to_ascii $((0x$hex_block % 64)))
		base_64_str=$(printf "$base_64_str\x$char1\x$char2")
	done
	
	
	if [ $remainder -eq 1 ]; then
		base_64_str=$(echo "$base_64_str" | awk '{ $0~gsub(/A$/, "=");} { print $0 }' )
	elif [ $remainder -eq 2 ]; then
		base_64_str=$(echo "$base_64_str==")
	fi
	

	echo $base_64_str
}

shell_get()
{
	full_url=$1

	protocol_str=$(echo $full_url | awk ' BEGIN {FS="://"} { if($0~/:\/\//)print $1 }')
	if [ "$protocol_str" != "http" ] && [ -n "$protocol_str" ] ; then
		echo "protocol = $protocol_str"
		echo "Error, unsupported Protocol"
		echo "Only http connections are supported at this time"
		return 1;
	fi


	if [ -n "$protocol_str" ] ; then
		full_url=$(echo $full_url | awk ' {$0~gsub(/http:\/\//, "")}; {print $0}')
	fi



	user_pass=$(echo $full_url | awk ' BEGIN {FS="@"}; { if( $0~/@/ && $1~/^[^\?\/]+:[^\?\/]+$/ ) print $1 }')
	host_and_args=""
	if [ -n "$user_pass" ]; then
		host_and_args=$(echo $full_url | awk ' $0~gsub(/^[^@]+@/, "") {print $0}')
	else
		host_and_args="$full_url"
	fi

	host_name=$(echo $host_and_args | awk ' BEGIN {FS="[:?/]"}; {print $1};')
	port_num=$(echo $host_and_args | awk ' BEGIN {FS="[?/]"}; { if($1~/:/){$1~gsub(/.*:/, ""); print $1;}else {print "80"}};')

	path=$(echo $host_and_args | awk ' { $0~gsub(/^[^\?\/]+/, "")}; {print $0};')
	path_start_test=$(echo "$path" | grep "^/") 
	if [ -z "$path_start_test" ]; then
		path="/$path"
	fi


	#echo "full_url=\"$full_url\""
	#echo "user_pass=\"$user_pass\""
	#echo "host_name=\"$host_name\""
	#echo "port_num=\"$port_num\""
	#echo "path=\"$path\""


	retrieved_data=""
	if [ -n "$user_pass" ]; then
		auth_str=$(encode_base64 "$user_pass" )
		#echo -e "GET $path HTTP/1.0\nHost: $host_name\nAuthorization: Basic $auth_str\nUser-Agent: shell_get 1.0\n\n"
		retrieved_data=$(echo -e "GET $path HTTP/1.0\nHost: $host_name\nAuthorization: Basic $auth_str\nUser-Agent: shell_get 1.0\n\n" | nc "$host_name" $port_num | cat)

	else
		#echo -e "GET $path HTTP/1.0\nHost: $host_name\nUser-Agent: shell_get 1.0\n\n"
		retrieved_data=$(echo -e "GET $path HTTP/1.0\nHost: $host_name\nUser-Agent: shell_get 1.0\n\n" | nc "$host_name" $port_num | cat)
	fi

	echo -e "$retrieved_data"

}

