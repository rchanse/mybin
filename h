#!/usr/bin/env bash

if [ ".$1" == "." ]; then
  echo "Checking "
  acroname=`head -n1 $HOME/bin/acrofile_name | tail -n1`
  wc $HOME/bin/acrofile_name
  cat $HOME/bin/acrofile_name
  echo "the file is " $acroname
  exit 
fi

p1=$1
if [ ".$p1" == ".off" ]; then 
  p1="OFF"
fi

if [ ".$p1" == ".OFF" ]; then 
  rm $HOME/bin/acrofile_name
  sleep 1
  touch $HOME/bin/acrofile_name
  nl=`wc $HOME/bin/acrofile_name`
  echo  $nl $nl
  exit 
fi


if [ ".$p1" == ".on" ]; then
  p1="ON" 
fi

if [ ".$p1" == ".ON" ]; then 
   echo -n "Enter the acroparm file name : "
   read answer   rest
   acroparm=$answer  
   echo $acroparm > $HOME/bin/acrofile_name
   echo "Using 2>"$acroparm"< for acro file name."
   cat $HOME/bin/acrofile_name
   exit
fi
echo acroparm is ">"$acroparm"<"

ff $1
