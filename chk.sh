#!/bin/sh

node ./sltz2der.mjs |
	while read tzletter der; do
		printf '%s\tconverted:' "${tzletter}"
		echo ${der} |
			cut -d: -f2- |
			python3 \
				-m asn1tools \
				convert \
				-i der \
				-o jer \
				./sltz.asn \
				TimeZoneInfo \
				- |
			jq \
				--compact-output \
				--raw-output \
				'keys[0]' |
			sed \
				-n \
				-E \
				-e 's/utc/UTC/' \
				-e 's/([0-9]{1,2})p/ +\1/' \
				-e 's/([0-9]{1,2})m/ -\1/' \
				-e 's/local/(Local)/' \
				-e 's/gmt/(GMT)/' \
				-e 's/unspecified/(Invalid Time Zone)/' \
				-e p
	done
