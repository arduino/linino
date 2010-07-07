#!/bin/sh
# Copyright (C) 2010 Vertical Communications
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

# . /etc/functions.sh
# . /usr/lib/freeswitch/uci/common/param_from_config.sh

fs_profile_gateway() {
	local cfg="$1"
	local param_file="$2"
	local param_list="username
string

password
password

realm
string

from-user
string

from-domain
string

extension
string

proxy
string

register-proxy
string

expire-seconds
integer

register
bool

register-transport
string

retry-seconds
integer

caller-id-in-from
bool

contact-params
string

extension-in-contact
string

ping
integer

[FS-EOF]
"

	fs_to_xml_param_list "$cfg" "$param_list" "$param_file"
}

fs_profile_internal_top() {
	local cfg="$1"
	local param_file="$2"
	local param_list="media-option
string

user-agent-string
string

debug
integer
0
shutdown-on-fail
bool

sip-trace
string
no
log-auth-failures
bool
true
context
string
public
rfc2833-pt
integer
101
sip-port
integer
\$\${internal_sip_port}
dialplan
string
XML
dtmf-duration
integer
2000
inbound-codec-prefs
string
\$\${global_codec_prefs}
outbound-codec-prefs
string
\$\${global_codec_prefs}
rtp-timer-name
string
soft
rtp-ip
string
\$\${local_ip_v4}
sip-ip
string
\$\${local_ip_v4}
hold-music
string
\$\${hold_music}
apply-nat-acl
string
nat.auto
extended-info-parsing
bool

aggressive-nat-detection
bool

enable-100rel
bool

enable-compact-headers
bool

enable-timer
bool

minimum-session-expires
integer

apply-inbound-acl
string
domains
local-network-acl
string
localnet.auto
apply-register-acl
string

dtmf-type
string
info
send-message-query-on-register
bool

record-path
string
\$\${recordings_dir}
record-template
string
\${caller_id_number}.\${target_domain}.\${strftime(%Y-%m-%d-%H-%M-%S)}.wav
manage-presence
bool
true
manage-shared-appearance
bool

dbname
string

presence-hosts
string

bitpacking
string

max-proceeding
integer

session-timeout
integer

multiple-registrations
string

inbound-codec-negotiation
string
generous
bind-params
string

unregister-on-options-fail
bool

tls
bool
\$\${internal_ssl_enable}
tls-bind-params
string
transport=tls
tls-sip-port
integer
\$\${internal_tls_port}
tls-cert-dir
string
\$\${internal_ssl_dir}
tls-version
string
\$\${sip_tls_version}
rtp-autoflush-during-bridge
bool

rtp-rewrite-timestamps
bool

pass-rfc2833
bool

odbc-dsn
string

inbound-bypass-media
bool

inbound-proxy-media
bool

inbound-late-negotiation
bool

accept-blind-reg
bool

accept-blind-auth
bool

suppress-cng
bool

nonce-ttl
integer
60
disable-transcoding
bool

manual-redirect
bool

disable-transfer
bool

disable-register
bool

NDLB-broken-auth-hash
bool

NDLB-received-in-nat-reg-contact
bool

auth-calls
bool
\$\${internal_auth_calls}
inbound-reg-force-match-username
bool
true
auth-all-package
bool
false
ext-rtp-ip
string
auto-nat
ext-sip-ip
string
auto-nat
rtp-timeout-sec
integer
300
rtp-hold-timeout-sec
integer
1800
vad
string

alias
string

force-register-domain
string
\$\${domain}
force-subscription-domain
string
\$\${domain}
force-register-db-domain
string
\$\${domain}
force-subscription-expires
integer

enable-3pcc
string

NDLB-force-rport
bool

challenge-realm
string
auto_from
disable-rtp-auto-adjust
bool

inbound-use-callid-as-uuid
bool

outbound-use-callid-as-uuid
bool

pass-callee-id
bool

auto-rtp-bugs
string

disable-srv
bool

disable-naptr
bool

[FS-EOF]
"
	fs_to_xml_param_list "$cfg" "$param_list" "$param_file"
}

fs_profile_external_top() {
	local cfg="$1"
	local param_file="$2"
	local param_list="debug
integer
0
shutdown-on-fail
bool

sip-trace
string
no
context
string
public
rfc2833-pt
integer
101
sip-port
integer
\$\${external_sip_port}
dialplan
string
XML
inbound-codec-prefs
string
\$\${global_codec_prefs}
outbound-codec-prefs
string
\$\${outbound_codec_prefs}
rtp-timer-name
string
soft
dtmf-duration
integer
2000
rtp-ip
string
\$\${local_ip_v4}
sip-ip
string
\$\${local_ip_v4}
ext-rtp-ip
string
auto-nat
ext-sip-ip
string
auto-nat
hold-music
string
\$\${hold_music}
aggressive-nat-detection
bool

enable-100rel
bool

local-network-acl
string
localnet.auto
manage-presence
bool
false
dbname
string

presence-hosts
string

tls
bool
\$\${external_ssl_enable}
tls-bind-params
string
transport=tls
tls-sip-port
integer
\$\${external_tls_port}
tls-cert-dir
string
\$\${external_ssl_dir}
tls-version
string
\$\${sip_tls_version}
nonce-ttl
integer
60
auth-calls
bool
false
inbound-codec-negotiation
string
generous
rtp-timeout-sec
integer
300
rtp-hold-timeout-sec
integer
1800
[FS-EOF]
"
	fs_to_xml_param_list "$cfg" "$param_list" "$param_file"
}
