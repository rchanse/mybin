#!/bin/bash

#  Below is the acro file (name of acro filename action    file )
file_input=$HOME"/bin/f_acrolist"

p1=$1       # save cmdline parms for later
p2=$2

#  Help info
if [ ".$1" == "." ] ; then
  echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo "::  f -  quick invocation to file                ::"
  echo "::  f parm1 parm2                                ::"
  echo "::    parm1                                      ::"
  echo "::      null   - display this help info          ::"
  echo "::      .      - go edit the acro list file      ::"
  echo "::      other  - acro for filename in file_input ::"
  echo "::    parm1    - action to take default vim      ::"
  echo "::                                               ::"
  echo "::                                               ::"
  echo ":: format of acro file    3 values               ::"
  echo "::   field1 acro  the acronym to search for      ::"
  echo "::   field2 filename to act upon                 ::"
  echo "::   field3 action to take  null  vim            ::"
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
    echo "matched acro : "$acro", filename :" $filename", action :"$action
    break                                # the quick out when found
  fi
done < $file_input       # end read loop from given file_input

# NOT found msg and exit
if [ "$found" == "no" ] ; then
  echo "::                                               "
  echo ::  acronym  $1  NOT found try . for acrolist 
  echo "::                                               "
  exit
fi

cmd_action=""                       # unknow what to do
# handling sudo to empower f   
sudoit=""                          # defaulting sudoit to null
if [ ".$p2" == ".sudo" ] ; then     # found on original cmd line
  sudoit="sudo"
  #  echo "parm 2 is sudo "
fi

# evaluate for cmd_action value
# parm 2 in cmdline supercedes

if [ ".$p2" != ".sudo" ] && [ ".$p2" != "." ] ; then   
  cmd_action=$p2 
fi

# Setting the command  action from line in file_input
#  remember cmdline parm 2 supercedes (if not sudo)
if [ ".$cmd_action" == "." ]; then        # cmd_action not set yet
  if [ ".$action" == "." ] ; then
    cmd_action=vim                    # the default
  else
    cmd_action=$action                # the override
  fi  
fi
 

# The actual work

# Handle ~/whoever   to become     /home/$USER/whoever
if [ ${filename:0:1} == "~" ] ; then
  if [ ".$UID" == ".0" ] ; then     # the root case
    lead="/root"
  else
    lead="/home/"$USER      #  non root user
  fi

  lead=$HOME              # now is /home/$USER   or   /root
  tailend=${filename:1}   # peel of the ~
  filename=$lead$tailend  # provide actual name 
  #echo $filename          # show on screen (just in case)
fi

#echo "sudoit :"$sudoit
#echo "filename :"$filename
#echo "cmd_action :"$cmd_action
echo $sudoit $cmd_action $filename
$sudoit $cmd_action $filename            # the actual work
