autoload -U compinit colors vcs_info
colors
compinit

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%B%F{blue}%9c%f%F{yellow}$(parse_git_branch)%f%b $ '

setopt sharehistory

# Report command running time if it is more than 3 seconds
REPORTTIME=3

# Keep a lot of history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY

# Also remember command start time and duration
setopt EXTENDED_HISTORY

# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS

# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE

# Correct spelling of all arguments in the command line
setopt CORRECT_ALL

# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
