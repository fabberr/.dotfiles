###############################################################################
#                                    General                                   #
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# GPG key
export GPG_TTY="$(tty)"

# OpenSSL
export SSL_CERT_DIR="/usr/lib/ssl/certs:/etc/ssl/certs"

################################################################################
#                      .NET [https://dotnet.microsoft.com]                     #
################################################################################

export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

################################################################################
#                           Zig [https://ziglang.org]                          #
################################################################################

export PATH="$PATH:$ZIG_ROOT:/usr/bin/zig:/usr/bin/zls"

################################################################################
#                ripgrep [https://github.com/BurntSushi/ripgrep]               #
################################################################################

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

################################################################################
#                     bat [https://github.com/sharkdp/bat]                     #
################################################################################

export BAT_CONFIG_PATH="$HOME/.config/bat/config"

################################################################################
#                       Yazi [https://yazi-rs.github.io]                       #
################################################################################

#
# Function: y
#
#   Wrapper function for the `yazi` command.
#   When invoked through this wrapper, Yazi will change the CWD when exiting.
#
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

################################################################################
#            bash-preexec [https://github.com/rcaloras/bash-preexec]           #
################################################################################

# Enable experimental subshell support
export __bp_enable_subshells="true"

[[ -f "$HOME/.bash-preexec.sh" ]] && source "$HOME/.bash-preexec.sh"

################################################################################
#                           Atuin [https://atuin.sh]                           #
################################################################################

export ATUIN_CONFIG_DIR="$HOME/.config/atuin"

eval "$(atuin init --disable-up-arrow bash)"

################################################################################
#                        Starship [https://starship.rs]                        #
################################################################################

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init bash)"

################################################################################
#                Zoxide [https://github.com/ajeetdsouza/zoxide]                #
################################################################################

_ZO_RESOLVE_SYMLINKS="1"

eval "$(zoxide init bash)"

