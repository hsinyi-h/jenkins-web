#!/bin/bash

COUNTER=0

while [[ $COUNTER -lt 50  ]]; do
	let COUNTER=COUNTER+1
	NAME=$(nl people.txt | grep -w $COUNTER | awk '{print $2}' | awk -F ',' '{print $1}')
	LASTNAME=$(nl people.txt | grep -w $COUNTER | awk '{print $2}' | awk -F ',' '{print $2}')
	AGE=$(shuf -i 25-30 -n 1)
	mysql -u root -ppassword users -e "insert into info values ($COUNTER, '$NAME', '$LASTNAME',$AGE)"
	if [[ $? -eq 0  ]]; then
		echo "$COUNTER, $NAME '$LASTNAME,$AGE was imported successfullly"
	fi
done
