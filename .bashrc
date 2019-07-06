# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Used in PS1 below
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set the prompt string and show the current branch if inside a git repository.
# Format example: user@host ~/code/dotfiles (master) $
if [ "$color_prompt" = yes ]; then
    PS1="\u@\h \[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
else
    PS1="\u@\h \w\$(parse_git_branch) $ "
fi
unset color_prompt

# Color output of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Color GCC output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Include other aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Include other functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
