# If not running interactively, don't do anything
[ -z "$PS1" ] && return

##########################################################################
###History
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000

##########################################################################
###Display
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

##########################################################################
###Behaviour
shopt -s no_empty_cmd_completion    #Seriously this is useless
shopt -s autocd                    #cd without typing cd, as in zsh

#More ls aliases    # TODO merge with the ones for zsh
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ll="ls -la"                                                                                                       
alias .="cd ../"                                                                                                        
alias ..="cd ../../"                                                                                                    
alias ...="cd ../../../"                                                                                                
alias ....="cd ../../../../"                                                                                            
alias jt="ssh reeb@jobtest.rostclust"                                                                                   
alias jt2="ssh reeb@jobtest2.rostclust"                                                                                 
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'                                            
alias lg='logout'                                                                                                       
alias ports='netstat -tulanp'                                                                                           
#Bioinformatics                                                                                                         
alias nfas='grep -c "^>"'
alias singfas='awk "/^>/ {printf(\"\n%s\n\",\$0);next; } { printf(\"%s\",\$0);}  END {printf(\"\n\");}"' #cf. http://www.biostars.org/p/9262/#9264

#Custom functions
#Bioinformatics
function splitfas {
    entrynum=`nfas $1 | wc -m`
    let "entrynum = $entrynum -1"
    csplit -z -s -f $1 --digits=$entrynum $1 '/>/' '{*}'
}
