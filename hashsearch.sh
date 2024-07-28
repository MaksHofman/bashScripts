#!/bin/bash
#-nh flaga pozwala na podanie pliku a nie samego hashkoda (not hash)
#Defoultowo podaje sie sam hash

function mkabspath
{
	if [[ $1 == /* ]]
	then
	  ABS=$1
	else
	  ABS="$PWD/$1"
	fi
}

if [[ ${1:0:3} == '-nh' ]]
then
	shift
	HASH=$(sha1sum "$1")
	HASH=${HASH%% *}
else
	HASH=$1
fi

DIR=${2:-.}

find $DIR -type f | while read fn
do
	THISONE=$(sha1sum "$fn")
	THISONE=${THISONE%% *}
	if [[ $THISONE == $HASH ]]
	then
		mkabspath "$fn"
		echo $ABS
	fi
done
