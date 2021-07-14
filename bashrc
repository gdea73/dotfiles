#
# ~/.bashrc
#

# If not running interactively, don't do anything
stty -ixon
shopt -s direxpand
[[ $- != *i* ]] && return
alias lsh='ls -lh'
alias scn='screen -dR'
alias scr='screen -r'
alias ls='ls --color=auto'
alias ..="cd .."
alias rm='rm -i'
alias x='startx'
alias mcam='make clean && make'
alias mcm='make clean && make'
alias mc='make clean'
alias mt='make test'
alias m='make'
alias v='nvim'
alias vim='nvim'

function sub_find_query {
    echo $@ | sed -e 's/:/*/g'
}

function f {
    query=$(sub_find_query "$@")
    find . -name $query
}

function g {
	grep --color=always -nIR "$@" .
}

export EDITOR=nvim
export PATH="$PATH:$HOME/etc/scripts:$HOME/scripts"

if ! [[ -z $short_hostname ]]; then
	PS1='\[\e[1;9'$((RANDOM % 7 + 1))'m\]('$short_hostname')(\w)\[\e[0m\] '
else
	PS1='\[\e[1;32m\](\h)(\W)\[\e[0m\] '
fi
TZ='America/Los_Angeles'; export TZ

# used to ensure CALF audio does not repeatedly mkdir $HOME/audio-projects
export LASH_NO_START_SERVER=1

export ANDROID_HOME=/opt/android-sdk
# fixes C++ lib crashes when running Android emulator
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

export REACT_TERMINAL=xterm-256color

# I don't know where this came from, but it is basically a globbing 'cd'
cdh() {
    if [ $# = 0 ]; then
		cd
	else
		case $1 in
			.)  echo "you are already here " ;;
			..) thisdir=$(pwd)
				prevdir=$(dirname $thisdir)
				cd $prevdir ;;
			*)  counter=$(ls -l | grep "^d.*$1" | awk '{print $9}' | wc -l)
				counter=$(expr $counter + 0)
		case $counter in
			1)	cd $(ls | grep "$1")
				pwd ;;
			0)	if test -d $1
				then cd $1
				else echo "no such directory"
				fi ;;
			*)	echo "the options are"
				for i in *$1*
				do test -d $i && echo "$i"
				done ;;
			esac ;;
		esac
	fi
}

alias packer='TMPDIR=$HOME/.packertmp packer'

case "$TERM" in
	xterm*) TERM=xterm-256color
esac
