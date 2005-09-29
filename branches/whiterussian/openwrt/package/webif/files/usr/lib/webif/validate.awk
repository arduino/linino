# $1 = type
# $2 = variable name
# $3 = field name
# $4 = options
# $5 = value
BEGIN {
	FS="|"
	output=""
}

{ 
	valid_type = 0
	valid = 1
	# XXX: weird hack, but it works...
	n = split($0, param, "|")
	value = param[5]
	for (i = 6; i <= n; i++) value = value FS param[i]
	verr = ""
}

$1 == "int" {
	valid_type = 1
	if (value !~ /^[0-9]*$/) { valid = 0; verr = "Invalid value" }
}

# FIXME: add proper netmask validation
($1 == "ip") || ($1 == "netmask") {
	valid_type = 1
	if ((value != "") && (value !~ /^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$/)) valid = 0
	else {
		split(value, ipaddr, "\\.")
		for (i = 1; i <= 4; i++) {
			if ((ipaddr[i] < 0) || (ipaddr[i] > 255)) valid = 0
		}
	}
	if (valid == 0) verr = "Invalid value"
}

valid_type != 1 { valid = 0 }

valid == 1 {
	n = split($4, options, " ")
	for (i = 1; (valid == 1) && (i <= n); i++) {
		if (options[i] == "required") {
			if (value == "") { valid = 0; verr = "No value entered" }
		} else if (options[i] ~ /^min=/) {
			if ($1 == "int") {
				min = options[i]
				sub(/^min=/, "", min)
				if (value < min) { valid = 0; verr = "Value too small" }
			}
		} else if (options[i] ~ /^max=/) {
			if ($1 == "int") {
				max = options[i]
				sub(/^max=/, "", max)
				if (value > max) { valid = 0; verr = "Value too large" }
			}
		}
	}
}

valid_type == 1 {
	if (valid == 1) output = output $2 "=\"" value "\";\n"
	else error = error "Error in " $3 ": " verr "<br />"
}

END {
	print output "ERROR=\"" error "\";\n"
}
