autoload -U compinit colors vcs_info
colors
compinit

#
# Prompt
#

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
PROMPT='%B%F{blue}%9c%f%F{yellow}$(parse_git_branch)%f%b '

#
# History
#

# https://zsh.sourceforge.io/Doc/Release/Options.html

# Remember command start time and duration
setopt EXTENDED_HISTORY

# Do not keep duplicate commands in history (remove the older one)
setopt HIST_IGNORE_ALL_DUPS

# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE

# Do not remember lines that differ only in whitespace
setopt HIST_REDUCE_BLANKS

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#
# General
#

# cd if just typing directory name (in current directory)
setopt autocd

# Correct spelling of arguments in the command line
setopt CORRECT_ALL

# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Support commands with # comments at the end
setopt interactivecomments

#
# Aliases
#

# Navigation

alias ..='cd ..'
alias ...='cd ../../'
# F to show file type, G to colour output
alias ls='ls -FG'
alias l='ls'
# A to show hidden files
alias la='ls -A'
# h to use human-readable file sizes, l for detailed list, t to sort by
# modified time, r to reverse it so that newest files are at the bottom closest
# to the prompt.
alias ll='ls -Ahltr'
alias dl='cd ~/Downloads'
alias j='cd ~/code/johnjago.com'

# Utilities

alias vim='nvim'
alias v='nvim'
alias r='ranger'
alias dt="date +'%Y-%m-%d %H:%M:%S %Z' | tr -d '\n' | pbcopy"

# Development

alias d='docker'
alias dc='docker compose'
alias c='composer'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# See [alias] section in .gitconfig
for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
done

# Stage and commit all files (modified, deleted, and untracked)
alias gac='git add -A && git commit'
