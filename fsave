#!/bin/bash

#  Below is the acro file (name of acro filename action    file )
file_input=$HOME"/bin/f_acrolist"

# save cmdline parms for later
p1=$1                         # first parm
if [ ".$2" == "." ]; then     # rest of cmdline
	p2=""
else
	shift
	p2=$@
fi

#  Help info
#echo "filename  :>"$filename
if [ ".$p1" == "." ] ; then
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "::  f -  quick invocation to file                ::"
	echo "::  f parm1 p2 p3 p4                             ::"
	echo "::    parm1                                      ::"
	echo "::      null   - display this help info          ::"
	echo "::      .      - go edit the acro list file      ::"
	echo "::      other  - acro for filename in file_input ::"
	echo "::    p2 p3 p4 - action to take default vim      ::"
	echo "::               e.g. f x sudo vim > sudo vim x  ::"
	echo "::                                               ::"
	echo ":: format of acro file    3 values               ::"
	echo "::   field1 acro  the acronym to search for      ::"
	echo "::   field2 filename to act upon                 ::"
	echo "::   field3 action to take  null  vim            ::"
	echo "::    (more info in the acro file itself.)       ::"
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
	exit 
fi

# path to the acro file
if [ ".$p1" == ".." ] ; then    # use  f .  to get to the acro file
	vim $file_input
	exit
fi


found="no"   

#  if null-line skip it
#     if char1 of acro is #  skip it
#        if passed-val is acro  mark found and bail to work

# while  read -r acro filename action rest ; do
while  read -r acro filename a1 a2 a3 rest ; do

	if [ "." != ".$acro" ]; then
		if [ ${acro:0:1}  != "#" ]; then
			if [ "$p1" == "$acro" ] ; then
				found="yes"
				if [ ".$a1" == "." ]; then
					line_action=''
				else
					line_action="$a1 $a2 $a3"
				fi
#" ,line_action :"$line_action
				break                # the quick out when found
			fi
		fi
	fi
	done < $file_input       # end read loop from given file_input

# NOT found msg and exit
if [ "$found" == "no" ] ; then
	echo "::                                               "
	echo ::  acronym  $p1  NOT found try . for acrolist 
	echo "::                                               "
	exit 4
fi

# Set the cmd_action value        
cmd_action="vim "                      # set the default

if [ ".$p2" != "." ] ; then            # cmd action override if exists
	cmd_action=$p2                                  
fi
if [ ".$line_action" != "." ] ; then   # override if line acro requires
	cmd_action=$line_action                                       
fi

# The actual file to work on 

# Handle ~/whoever   to become     /home/$USER/whoever
if [ ${filename:0:1} == "~" ] ; then
	lead=$HOME              # now is /home/$USER   or   /root
	tailend=${filename:1}   # peel off the ~
	filename=$lead$tailend  # provide actual name 
fi

echo "acro line override:"$line_action
echo "cmdline override:" $p2
echo "acro:"$p1", filename:"$filename
echo $cmd_action $filename
$cmd_action $filename

