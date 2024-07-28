#!/bin/bash
#scrypt wypisuje wszystkie ukryte foldery (dziala na linuxie i na windowsie))

function checkOs
{
if type -t wevtutil &> /dev/null
then
  OS=MSWin
elif type -t scutil &> /dev/null
then
  OS=macOS
else
  OS=Linux
fi
}

checkOs
if [[ $OS == "macOS" ]]
then
	exit -2
fi

if [[ $OS == "MSWin" ]]
then
	find . -exec attrib '{}' \; | egrep '^.{4}H.*' | cut -c22-
else
	find /home -name '.*'
fi
