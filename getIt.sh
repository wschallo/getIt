#!/bin/sh

#####################################################################
#usage: copy (and unzip) fits files, and copy csv files for galaxies #
#last updated: 8/27/2019                                             #
#author: William Schallock                                           #
######################################################################
#edit this section to fit your needs:

spiral_source="P_SP.9-mR16-17.txt" #spiral galaxies names
elliptical_source="P_EL.9-mR16-17.txt" #elliptical galaxies names

#spiral_dir="/home/$USER/galaxies/sp" #dir for spiral galaxies
#elliptical_dir="/home/$USER/galaxies/el" #dir for elliptical galaxies
spiral_dir="/extra/wayne_scratch1/galaxies/sp"
elliptical_dir="/extra/wayne_scratch1/galaxies/el"

wavebands=(
	"g"
	"r"
	"i"
	"u"
	"z"
) #fetch these waveband; valid waveband are ["g","r","i","u","z"]; see: http://skyserver.sdss.org/dr1/en/proj/advanced/color/sdssfilters.asp for more info

############################################################

#check if spiral directory exists if not make it:
if [ ! -d $spiral_dir ]; then
	mkdir -p $spiral_dir
fi

#check if elliptical directory exists if not make it:
if [ ! -d $elliptical_dir ]; then
        mkdir -p $elliptical_dir
fi

#get files:
for color in "${wavebands[@]}"; do
	echo "Getting spiral fits files for $color waveband."
	./getGalaxies.sh "$spiral_source" "$spiral_dir" "$color" #get spiral fits of the "color" waveband and copy it to the spiral_dir
	echo "Getting spiral csv files for $color waveband."
	./getParams.sh "$spiral_source" "$spiral_dir" "$color" #get spiral csv file of the "color" waveband and copy it to the spiral_dir
	
	echo "Getting elliptical fits files for $color waveband."
	./getGalaxies.sh "$elliptical_source" "$elliptical_dir" "$color" #get elliptical fits of the "color" waveband and copy it to the elliptical_dir
	echo "Getting elliptical csv files for $color waveband."
	./getParams.sh "$elliptical_source" "$elliptical_dir" "$color"  #get elliptical fits of the "color" waveband and copy it to the elliptical_dir

done
