#!/bin/sh

while true; do
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
	date=$(date +'%Y-%m-%d %X')
	echo "Vol: $volume | $date"
	sleep 1
done
