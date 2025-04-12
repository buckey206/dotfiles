# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth
#
# append to the history file, don't overwrite it
#shopt -s histappend
#
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE='INFINITY'
HISTFILESIZE='ANDBEYOND'

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups:ignorespace
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend	# append history not overwrite it
shopt -s checkwinsize	# check window on resize; for word wrapping
shopt -s autocd		# instead of 'cd Pictures', just run Pictures
shopt -s cdspell	# auto correct cd; cd /sur/src/linus' >> 'cd /usr/src/linux'
shopt -s cmdhist	# If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands.
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

## AutoCompletion
#bind '"\e[Z":menu-complete-backward'	# Shift+Tab: Cycle backwards
#bind '"\t":menu-complete' 		# Tab: Cycle thru completion
bind 'set completion-ignore-case on'    # case insensitive on tab completion
bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


BROWSER=firefox


#### FUNCTIONS

ramen() { 
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ ${UID} != 0 ]; then tmux new-session -A -s ramen; else tmux attach ; fi &> /dev/null
}

#### ALIASES 

alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
#alias ls='lsd'
alias tsp-youtube='TS_SOCKET=/tmp/tsp-youtube tsp'
alias vim='nvim'

#### VARIOUS ADDITIONAL COMMANDS AND THEIR CONFIGURATION


## NFTY shell integration https://github.com/dschep/ntfy
#### NOT WORKING CURRENTLY SO COMMENTED OUT
#eval export AUTO_NTFY_DONE_LONGER_THAN=-L120
#export AUTO_NTFY_DONE_UNFOCUSED_ONLY=-b
#source /home/jared/.local/share/ntfy/bash-preexec.sh
#source /home/jared/.local/share/ntfy/auto-ntfy-done.sh
## To use ntfy's shell integration, run this and add it to your shell's rc file:
## eval "$(ntfy shell-integration)"
#export AUTO_NTFY_DONE_IGNORE="ramen mpv vim man screen meld nvim tmux cheat"

#eval "$(thefuck --alias)"

# fzf keybindings
#source /usr/share/doc/fzf/examples/key-bindings.bash

# fzf fuzzy autocomplete
#source /usr/share/doc/fzf/examples/completion.bash
## # apparently you no longer need to source this

# fzf find files and open them with preffered application
fzf-locate() { xdg-open "$(locate "*" | fzf -e)" ;}


## Cheat fzf integration
export CHEAT_USE_FZF=true

## Bashmarks https://github.com/huyng/bashmarks
#source ~/.local/bin/bashmarks.sh

# pipx completion`
export PATH="$PATH:/home/jared/.local/bin"
eval "$(register-python-argcomplete pipx)"

### START FABRIC
# For Fabric 
# Golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
# Loop through all files in the ~/.config/fabric/patterns directory
for pattern_file in $HOME/.config/fabric/patterns/*; do
    # Get the base name of the file (i.e., remove the directory path)
    pattern_name=$(basename "$pattern_file")

    # Create an alias in the form: alias pattern_name="fabric --pattern pattern_name"
#    alias_command="alias $pattern_name='fabric --pattern $pattern_name'"
    alias_command="alias $pattern_name='fabric --pattern=$pattern_name'"

    # Evaluate the alias command to add it to the current shell
    eval "$alias_command"
done

yt() {
    local video_link="$1"
    fabric -y "$video_link" --transcript
}


# Custom completion function for fabric --pattern=
_fabric_pattern_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -W "$(ls ~/.config/fabric/patterns/)" -- $cur))
}

# Register the completion function for the fabric command
complete -F _fabric_pattern_complete fabric

### END FABRIC
export EDITOR=nvim

#export EDITOR=vim

# fnm
#export PATH=/home/jared/.fnm:$PATH
#eval "`fnm env`"


sf() {
  if [ "$#" -lt 1 ]; then echo "Supply string to search for!"; return 1; fi
  printf -v search "%q" "$*"
  include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst"
  exclude=".config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist"
  rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
  files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
  [[ -n "$files" ]] && ${EDITOR:-vim} $files
}


bookmarksurf() {
    surfraw -browser="surf" "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf -e)"
}
bookmarks() {
    cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf | awk 'BEGIN {OFS=" "}; {print $2}'
}
#. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jared/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jared/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jared/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jared/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

