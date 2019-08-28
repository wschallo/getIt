#!/bin/bash

orignal_location="/home/wayne/research/drdavis/SDSS/SpArcFiRe/2016-09/"

#check if input file is valid
if [[ ! -f $1 ]]; then
        echo "Error: $1 is not a valid file."
        exit
fi

#make directory if doesn't exist
if [ ! -d $2 ]; then
	mkdir $2
fi

#check if color band is passed
if [ -z "$3" ]; then
	echo "Error: need to pass colorband as an argument."
	exit
fi

#iterate through lines of file
while read line; do
        hash_var=${line: -3}
	color=$3
        path="$orignal_location""$color"/"$hash_var"/"$line"/"$line".csv
	if [[ -f $path ]]; then
		base_new_path="$2"/"$line"
		if [ ! -d $base_new_path ]; then
			mkdir $base_new_path
		fi
		new_path="$base_new_path"/"$line"_"$color".csv
		cp "$path" "$new_path" #copy csv file
	fi


done < $1

