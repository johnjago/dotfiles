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

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ General                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝

# cd if just typing directory name (in current directory)
setopt autocd

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

alias l='ls -l'
alias ls='ls -CF --color=auto'
alias la='ls -A'
alias ll='ls -Ahl'
alias h='history'
alias g='grep'
alias c='clear'
alias e='exit'
alias vim='nvim'
alias v='nvim'
alias r='ranger'
alias d='docker'
alias dc='docker compose'

alias ..='cd ..'
alias ...='cd ../../'
alias dl='cd ~/Downloads'
alias ds='cd ~/Documents'
alias n='cd ~/Documents/notes'
alias co='cd ~/code'
alias j='cd ~/code/johnjago.com'
alias b='cd ~/code/johnjago.com/src/blog'
alias u=' cd ~/code/undo.studio'

# See [alias] section in .gitconfig
for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
done

# Stage and commit all files (modified, deleted, and untracked)
alias gac='git add -A && git commit -m'
