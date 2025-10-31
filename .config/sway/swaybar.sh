#!/bin/sh

# Requires NerdFonts
separator="\u2502"

while true; do
	amixer=$(amixer sget Master)
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <<<"$amixer")
	muted=$(awk '/\[off\]/ { print "true"; exit }' <<<"$amixer")
	date=$(date +'%Y-%m-%d %H:%M:%S')
	if [[ "$muted" == "true" ]]; then
		soundStatus="\ueee8  Muted"
	else
		soundStatus="\uf028  $volume"
	fi
	echo -e "$soundStatus $separator $date "
	sleep 1
done
