# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# taken from /etc/login.defs on my Xubuntu
##  *REQUIRED*  The default PATH settings, for superuser and normal users.
## #
## # (they are minimal, add the rest in the shell startup files)
## ENV_SUPATH	PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
## ENV_PATH	PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# arm with  export profile="ON"
function ech0 () {
  if [ ".$profile" == ".ON" ]; then
    echo $@
  fi
}

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games
ech0 "Before call to .bashrc"
ech0 "(1) original PATH : "$PATH

ech0 ' '
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

ech0 "after  call to .bashrc"
ech0 "(A)"$PATH
# set PATH so it includes user's private bin directories
#PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# change by rchansen make me last
ech0 "Add my libs"
PATH="$HOME/.local/bin:$PATH:$HOME/bintest:$HOME/bin:."
ech0 "(My)"$PATH
# Ubuntu make installation of Ubuntu Make binary symlink
#PATH=/home/rchansen/.local/share/umake/bin:$PATH
#ech0 "(3)"$PATH

