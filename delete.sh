#!/bin/bash
for jpg in ./*.jpg
do
	NAME=${jpg%-*}
	ID=${NAME##*/}
	DIVIDER=1000
       	DIVIDED=$((ID/DIVIDER))
	if [[ $DIVIDED -gt 10 ]]
	then
		if [[ $ID -ne 200000 ]]
		then
			DIVIDER2=10
			DIVIDED2=$((DIVIDED%DIVIDER2-1))
			if [[ $DIVIDED2 -ne 0 ]]
			then
				rm $jpg
			fi
		fi
	fi
done
