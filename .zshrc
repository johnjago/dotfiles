autoload -U compinit colors vcs_info
colors
compinit

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Prompt                                                                     ║
# ╚════════════════════════════════════════════════════════════════════════════╝

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%B%F{blue}%9c%f%F{yellow}$(parse_git_branch)%f%b '

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ History                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝

setopt sharehistory

# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY

# Also remember command start time and duration
setopt EXTENDED_HISTORY

# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS

# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ General                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝

# Correct spelling of all arguments in the command line
setopt CORRECT_ALL

# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Support commands with # comments at the end
setopt interactivecomments

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Aliases                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝

alias ..='cd ..'
alias ...='cd ../../'
alias ce='cd ~/code'
alias blog='cd ~/code/johnjago.com/src/blog'
alias dl='cd ~/downloads'
alias notes='cd ~/documents/notes'
alias ls='ls -CF --color=auto --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -al'
alias h='history'
alias g='grep'
alias c='clear'
alias e='exit'
alias v='vim'
alias r='ranger'
alias s='slock'
alias d='docker'
alias dc='docker-compose'

# Show the battery status like this:
#   state:               discharging
#   time to empty:       5.8 hours
#   percentage:          58%
alias bat='upower -i $(upower -e | grep '/battery') | grep --color=never -E "state|to\ full|to\ empty|percentage"'

# See [alias] section in .gitconfig
for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
done

# Stage and commit all files (modified, deleted, and untracked)
alias gac='git add -A && git commit -m'

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ I should really bind some keys                                             ║
# ╚════════════════════════════════════════════════════════════════════════════╝

# Set audio volume. For example, `a 50` sets volume to 50%
function a() {
  amixer set Master "$1"%
}

# Set brightness, for example, `b 50` sets brightness to 50%
function b() {
  xbacklight -set "$1"%
}
