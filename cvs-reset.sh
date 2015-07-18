#!/bin/sh 

if [ $# -ne 1 ]; then
	echo "Require directory. Exiting."
	exit 1
fi
DIR=$1
if [ ! -d ${DIR} ]; then
	echo "$DIR is not a directory. Exiting."
	exit 1
fi

cd $DIR
if [ ! -d CVS ]; then
	echo "Directory not a CVS repository. Exiting."
	exit 1
fi

for MODIFIED_FILE in `cvs up . 2>/dev/null | grep -E '^M|^C|^\?' | awk '{print $2}'`; do 
	echo "Removing ${DIR}/${MODIFIED_FILE}"
	rm -f "${DIR}/${MODIFIED_FILE}"
done
