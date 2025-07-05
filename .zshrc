# All options: https://zsh.sourceforge.io/Doc/Release/Options.html

#
# Prompt
#

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
# %9c means show up to the last 9 components of the current directory.
PROMPT='%B%F{blue}%9c%f%F{yellow}$(parse_git_branch)%f%b '

#
# Completions
#

autoload -U compinit && compinit
zstyle ':completion:*' completer _complete _correct _approximate
setopt CORRECT_ALL

#
# History
#

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Include a timestamp and duration in seconds with each command.
setopt EXTENDED_HISTORY

# Do not enter commands into the history list if they are duplicates of the
# previous command. This is helpful when using the up arrow to go through
# recent history.
setopt HIST_IGNORE_DUPS

#
# Aliases
#

# Navigation

# cd if just typing directory name.
setopt AUTO_CD

alias ..='cd ..'
alias ...='cd ../../'
# F to show file type, G to colour output.
alias ls='ls -FG'
alias l='ls'
# A to show hidden files.
alias la='ls -A'
# h to use human-readable file sizes, l for detailed list, t to sort by
# modified time, r to reverse it so that newest files are at the bottom closest
# to the prompt.
alias ll='ls -Ahltr'

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

# Stage and commit all files (modified, deleted, and untracked).
alias gac='git add -A && git commit'

#
# Other
#

# Allow commands with # comments at the end.
setopt INTERACTIVE_COMMENTS
