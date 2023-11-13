#!/bin/bash

if [ "$1" == "" ]
then
	echo "Format error."
	echo "Usage: $(basename $0) CS21B076.P4.tar.gz"
	exit
fi
if [ ! -f "$1" ]
then
	echo "Could not find the submission file $1."
	exit
fi

ROLL=$(echo $1 | cut -f1 -d. | tr [A-Z] [a-z])
cat $1 | ssh -q $ROLL@10.42.82.229
