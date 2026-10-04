command -v starship > /dev/null 2>&1 || return

################################## Environment #################################

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

############################## Shell Integrations ##############################

eval "$(starship init bash)"
