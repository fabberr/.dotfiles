command -v zoxide > /dev/null 2>&1 || return

################################## Environment #################################

export _ZO_RESOLVE_SYMLINKS="1"

############################## Shell Integrations ##############################

eval "$(zoxide init bash)"
