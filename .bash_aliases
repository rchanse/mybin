#!/bin/bash
# taken from http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias p3='ping -c 3 '
alias ping5='ping -c 5'
alias openports='netstat -tulanp'
if [ ".$UID" == ".0" ]; then
  alias psshort="PS1='\W # '"
  alias  pslong="PS1='\w # '"
  alias      Ps="PS1='\h \W # '"
  alias      Pl="PS1='\h \w # '"
else
  alias psshort="PS1='\W $ '"
  alias  pslong="PS1='\w $ '"
  alias      Ps="PS1='\h \W $ '"
  alias      Pl="PS1='\h \w $ '"
fi

if [ ".$UID" == ".0" ]; then
  alias upsshort="PS1='\u \W # '"
  alias upslong="PS1='\u \w # '"
  alias     uPs="PS1='\u@\h \W # '"
  alias     uPl="PS1='\u@\h \w # '"
else
  alias upsshort="PS1='\u \W $ '"
  alias upslong="PS1='\u \w $ '"
  alias     uPs="PS1='\u@\h \W $ '"
  alias     uPl="PS1='\u@\h \w $ '"
fi
alias lsd='ls -al | grep ^d'
alias lsc='ls --color=auto '
unalias ls
unalias grep


alias lsd='ls -al | grep "^d"'

alias ntx='date "+%a  %d %b %Y   %r "'
alias v2='vim tempname'
# :alias g='vim --remote-silent'

