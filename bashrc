#
# ~/.bashrc
#

# oCAML package manager
. /home/gdea73/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

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
alias mnvpn='cd /etc/openvpn; sudo openvpn ovpn_tcp/us787.nordvpn.com.tcp.ovpn'
alias react-native='TERM=linux react-native'
alias mcam='make clean && make'
alias mcm='make clean && make'
alias mc='make clean'
alias mt='make test'
alias m='make'
alias v='nvim_terminal_edit.py'
alias vim='nvim_terminal_edit.py'

function g {
	grep --color=always -nIR "$@" .
}

export fb='192.168.1.73'

export EDITOR=nvim

if ! [[ -z $short_hostname ]]; then
	PS1='\[\e[1;9'$((RANDOM % 7 + 1))'m\]('$short_hostname')(\W)\[\e[0m\] '
else
	PS1='\[\e[1;32m\](\h)(\W)\[\e[0m\] '
fi
TZ='America/Los_Angeles'; export TZ
PATH=$PATH:/home/gdea73/etc/scripts/:/home/gdea73/Code/Android/SDK/tools:$(yarn global bin):/home/gdea73/.cargo/bin:/home/gdea73/.gem/ruby/2.5.0/bin && export PATH
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

# used to ensure CALF audio does not repeatedly mkdir $HOME/audio-projects
export LASH_NO_START_SERVER=1

export ANDROID_HOME=/opt/android-sdk
# fixes C++ lib crashes when running Android emulator
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

export REACT_TERMINAL=xterm-256color

CLASSPATH=/usr/share/java/junit.jar:/usr/share/java/bsh.jar:. && export CLASSPATH

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

# include libraries I wrote (but I haven't written anything useful)
export LD_LIBRARY_PATH="/home/gdea73/Code/C/lib:$LD_LIBRARY_PATH:$HOME/Code/libation/lib"

spare_modifier="Hyper_L" 

alias packer='TMPDIR=$HOME/.packertmp packer'

case "$TERM" in
	xterm*) TERM=xterm-256color
esac
