# getIt
Get fits and csv files from openlab

## Instructions:
1) Clone this repo on openlab: git clone https://github.com/wschallo/getIt
2) Edit the file getIt.sh (if needed) [see getIt.sh section below]
3) run getIt.sh: ./getIt.sh


## getIt.sh
This is the main script that gets fits files and csv file for the SDSS galaxies on openlab.
By default it get's:
  - 5344 spiral galaxies
  - 11995 elliptical galaxies
 From 5 wave bands: ["r", "g", "i", "u", "z"]
 
 If you need to change this, you can edit the getIt.sh file. 
 You can edit any of the following:
  - which wavebands to fetch (edit wavebands)
  - which galaxies to get (edit spiral_source and elliptical_source) 
  - where to download the files (edit spiral_dir and elliptical_dir) 

## Notes:
  - By default the galaxies names are provided in a text file, where each line contains the name of one galaxy.
  - This script will create the directories if they do not already exist
  - You will need write permission in the directory you are copying the files to
  - Please note that the openlab admins impose a quota on # of files, and space in home directory
