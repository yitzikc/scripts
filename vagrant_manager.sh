#!/bin/bash
#
# Bash script to start/stop my local vagrant boxes.
# Author: luismartingil
# Year: 2012
#

# Root folder where the vagrant boxes are stored.
ROOT=/Volumes/lmartin_data/vagrant/

# This ARRAY contains the folder names of the vagrant boxes.
ARRAY=( 
    100ua-debian-squeeze-amd64
    101ua-pjsua-debian-squeeze-amd64 
    102ua-pjsua-debian-squeeze-amd64 
    103ua-pjsua-debian-squeeze-amd64
    )

# Let's grab the user's input param. 
case $@ in
    start)
	cmd=(vagrant up)
	;;
    stop)
	cmd=(vagrant halt)
	;;
    resume)
	cmd=(vagrant resume)
	;;
    suspend)
	cmd=(vagrant suspend)
	;;
    status)
	cmd=(vagrant status)
	;;
    *)
	echo 'Please select start/stop/resume/suspend/status'
	exit 0
	;;
esac

# Now we now what to do and where.
# Don't forget that vagrant {up, halt} MUST be sequential.
for i in "${ARRAY[@]}"
do
    echo '========='
    echo $ROOT$i
    cd $ROOT$i
    "${cmd[@]}"
    echo ' '
done