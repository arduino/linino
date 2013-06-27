#!/bin/sh -ex

SD=/mnt/sd

post_auto_mount() {
	local mnt_path=$1

	if [ -d "$mnt_path/arduino" ]; then
		if [ ! -L $SD ] || [ ! -d $SD ]; then
			ln -s $mnt_path $SD
			logger -t "automount" "arduino folder found: $mnt_path is now available at $SD"
		fi
	fi
}

post_auto_umount() {
	if [ -L $SD ]; then
		if [ ! -d $SD ]; then
			rm $SD
		fi
	fi
}
