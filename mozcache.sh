#!/usr/bin/env bash
# Simple script to perform forensic analysis of the Mozilla-Browser cache (Firefox, Iceweasel and Seamonkey).
# Enter the path to the cache directory of a Mozilla browser profile: $HOME/.cache/mozilla/firefox/xxxxxxxx.default
# Author: Busindre (busilezas[@]gmail.com) / www.busindre.com

#echo -e "Mozilla profiles cache directories found:\n\n`ls -dtU $HOME/.cache/mozilla/*/*default* 2>/dev/null || echo None.`\n"
echo -e "Mozilla profiles cache directories found:\n\n` stat -c "%y %n" $HOME/.cache/mozilla/*/*default* 2>/dev/null || echo None.`\n"
read -ep "Cache directory path to analyze: " dir
read -ep "Output directory path ($HOME/mozcache): " output
output=${output:-$HOME/mozcache}

# Get the timestamps of cache files and create folders with date.
for each in $dir/cache2/entries/*
do
	date=$(date +%d-%m-%Y -r "$each" 2>/dev/null) || { echo -e "\nSorry, Mozilla cache2 format in $dir not found!" && exit 1; }
  	_DATES+=($date);
  	FILES+=($each);
done

DATES=$(printf "%s\n" "${_DATES[@]}" | sort -u);

for date in ${DATES[@]}; do
	if [ ! -d "$date" ]; then
    		mkdir -p "$output/$date"
  	fi
done

# Copy the contents of the cache into the corresponding directory.
for i in  ${FILES[@]}; do
	dest=$(date +%d-%m-%Y -r "$i")
	cp -p $i $output/$dest
done

# Extraction of metadata.
for i in $output/*/*; do 
	strings $i | sed -n -e '/:http:\/\//,$p' -e '/:https:\/\//,$p' > "${i}_metadata"
done
