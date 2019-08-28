#!/bin/bash

#orignal_location="/home/wayne/research/drdavis/SDSS/FITS/hash/"
original_location="/extra/wayne1/research/drdavis/SDSS/FITS/color/"
#color="g"
#check if input file is valid
if [[ ! -f $1 ]]; then
	echo "Error: $1 is not a file."
	exit
fi

#make directory if doesn't exist
if [ ! -d $2 ]; then
	mkdir $2
fi

#check if color band is passed
if [ -z "$3" ]; then
	echo "Error: No colorband passed"
	exit
fi

#iterate through lines of file
while read line; do
	#hash_var=${line: -2}
	hash_var=${line: -3}
	color="$3"
	#path="$orignal_location""$hash_var"/"$line"/"$line"_r.fits.gz
	#new_path="$2"/"$line"_r.fits.gz
	path="$original_location""$color"/"$hash_var"/"$line".fits.gz
        #echo "$path"	
	if [[ -f $path ]]; then
		base_new_path="$2"/"$line"
		if [ ! -d $base_new_path ]; then
			mkdir $base_new_path
		fi
		new_path="$base_new_path"/"$line"_"$color".fits.gz
		cp $path $new_path #copy file
	        gunzip $new_path #extract .gz files (automatically deletes .gz in location new_path)
	fi

done < $1
