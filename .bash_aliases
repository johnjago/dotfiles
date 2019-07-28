# Show the battery status like this:
#   state:               discharging
#   time to empty:       5.8 hours
#   percentage:          58%
alias bat='upower -i $(upower -e | grep '/battery') | grep --color=never -E "state|to\ full|to\ empty|percentage"'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias c='clear'
alias re='reset'
alias r='ranger'

# See [alias] section in .gitconfig
for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
done

# Stage and commit all files (modified, deleted, and untracked)
alias gac='git add -A && git commit -m'
