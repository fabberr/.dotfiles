command -v rg > /dev/null 2>&1 || return

################################## Environment #################################

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"
