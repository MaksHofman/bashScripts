#!/bin/bash
#Moj 1 scrypt. szyka w dir w ktorym odpalisz i w pochodnych dirach pliku zapomoca grepa.

function goto
{
if [[ -d $1 ]]
then
 cd $1
 for ZMINE in $(ls | grep $2)
 do
  echo $ZMINE
 done
 cd ..
fi
}


function normalLsGrep
{
 for VALMI in $(ls | grep $1)
 do
  echo $VALMI
 done
}


function main
{
 normalLsGrep $1
 for VARR in $(ls)
  do
   goto $VARR $1
  done
}

main $1
