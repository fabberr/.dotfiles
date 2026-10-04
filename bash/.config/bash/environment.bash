#################################### General ###################################

export EDITOR="nvim"
export VISUAL="code"
export PAGER="less"

############################# XDG Base Directories #############################

# https://specifications.freedesktop.org/basedir/latest/
# https://wiki.archlinux.org/title/XDG_Base_Directory

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

###################################### GPG #####################################

export GPG_TTY="$(tty)"

#################################### OpenSSL ###################################

export SSL_CERT_DIR="/etc/ssl/certs"

##################################### Other ####################################

export SCRIPTS_HOME="$HOME/Code/scripts"

bash_scripts_home="$SCRIPTS_HOME/bash"

##################################### $PATH ####################################

# Application-specifict modifications to `$PATH` should be provided by the app's
# own configuration package.

export PATH="$bash_scripts_home:$PATH"

################################# Uncatagorized ################################

