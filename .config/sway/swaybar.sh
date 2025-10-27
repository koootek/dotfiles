#!/bin/sh

# Requires NerdFonts
separator="\u2502"

while true; do
	amixer=$(amixer sget Master)
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <<<"$amixer")
	muted=$(awk '/\[off\]/ { print "true"; exit }' <<<"$amixer")
	date=$(date +'%Y-%m-%d %H:%M:%S')
	if [[ "$muted" == "true" ]]; then
		bartext="\ueee8  Muted"
	else
		bartext="\uf028  $volume"
	fi
	echo -e "$bartext $separator $date "
	sleep 1
done
