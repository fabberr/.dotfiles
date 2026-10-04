command -v fastfetch > /dev/null 2>&1 || return

################################## Environment #################################

# Exports `FASTFETCH_LOGO`, which will be expanded by fastfetch's main
# configuration file.

data_home_path="$XDG_DATA_HOME/fastfetch"
custom_logo_path="$data_home_path/.custom-logo.txt"

[[ -f "$custom_logo_path" ]] && export FASTFETCH_LOGO="$custom_logo_path"
