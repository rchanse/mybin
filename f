#!/bin/bash

#  Below is the acro file (name of acro filename action    file )
file_input=$HOME"/bin/f_acrolist"

#  Help info
if [ ".$1" == "." ] ; then
  echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo "::  f -  quick invocation to file                ::"
  echo "::    f parm1                                    ::"
  echo "::      null   - display this help info          ::"
  echo "::      .      - go edit the acro list file      ::"
  echo "::      other  - take action on the assoc file   ::"
  echo "::                                               ::"
  echo "::                                               ::"
  echo ":: format of acro file    3 values               ::"
  echo "::   parm1  acro  the acronym to search for      ::"
  echo "::   parm2  action to take  null  vim            ::"
  echo "::          if action is sudo then sudo vim acro ::"
  echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
  exit 
fi

if [ ".$1" == ".." ] ; then    # use  f .  to get to the acro file
  vim $file_input
  exit
fi


found="no"
while  read -r acro filename action ; do
  if [ "$1" == "$acro" ] ; then
    found="yes"
    echo "match for "$acro $filename
    break                                # the quick out when found
  fi
done < $file_input

# NOT found msg and exit
if [ "$found" == "no" ] ; then
  echo "::                                               "
  echo ::  acronym  $1  NOT found try . for acrolist 
  echo "::                                               "
  exit
fi

# Setting the default action
if [ ".$action" == "." ] ; then
  action=vim
fi

# handling sudo to empower f
if [ ".$2" == ".sudo" ] ; then
  action="sudo vim"
  echo "parm 2 is sudo "
fi

# The actual work
echo For acronym $acro 
echo action/filename is $action $filename

# Handle ~/whoever to become yhome/$USER/whoever
if [ ${filename:0:1} == "~" ] ; then
  if [ ".$UID" == ".0" ] ; then
    lead="/root"
  else
    lead="/home/"$USER      #  non root user
  fi
  lead=$HOME
  tailend=${filename:1}
  filename=$lead$tailend
  echo $filename
fi

$action $filename
echo $action $filename
