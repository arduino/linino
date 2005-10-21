#!/bin/bash
BASE=http://svn.openwrt.org/openwrt/branches/whiterussian/openwrt/package
TARGET=$1
CONTROL=$2
VERSION=$3
ARCH=$4

mkdir -p "$TARGET/CONTROL"
grep '^[^(Version|Architecture)]' "$CONTROL" > "$TARGET/CONTROL/control"
grep '^Maintainer' "$CONTROL" 2>&1 >/dev/null || \
	echo "Maintainer: OpenWrt Developers Team <openwrt-devel@openwrt.org>" >> "$TARGET/CONTROL/control"
grep '^Source' "$CONTROL" 2>&1 >/dev/null || {
	pkgname=$(pwd | awk -F/ '{ n = split($0, p, "/"); if ((p[n - 1] == "package") && (p[n - 2] == "openwrt")) print p[n] }')
	[ -z "$pkgname" ] && src="http://svn.openwrt.org" || src="$BASE/$pkgname"
	echo "Source: $src" >> "$TARGET/CONTROL/control"
}
echo "Version: $VERSION" >> "$TARGET/CONTROL/control"
echo "Architecture: $ARCH" >> "$TARGET/CONTROL/control"
chmod 644 "$TARGET/CONTROL/control"
