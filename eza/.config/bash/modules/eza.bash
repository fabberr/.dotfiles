command -v eza > /dev/null 2>&1 || return

################################### Functions ##################################

# Applies default flags
eza() {
    command eza \
        --color=auto \
        --icons=auto \
        --time-style=long-iso \
        --header \
        --group-directories-first \
        --sort=name \
        --git \
        --git-repos-no-status \
        --show-symlinks \
        "$@"
}

#################################### Aliases ###################################

# `ls` replacement
alias 'ls'='eza'

# `tree` replacement
alias 'tree'='eza --tree --ignore-glob=.git'

# `tree` shorthands
alias 't'='tree -alL1'

alias 'ta'='tree --all'
alias 'tl'='tree --long'
alias 'tla'='tree --long --all'
