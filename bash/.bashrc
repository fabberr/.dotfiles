################################################################################
#                                    General                                   #
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# Functions
[[ -f "$HOME/.bash_functions" ]] && source "$HOME/.bash_functions"

# GPG key
export GPG_TTY="$(tty)"

# OpenSSL
export SSL_CERT_DIR="/etc/ssl/certs"

# Other Variables
export CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME="$CONFIG_HOME"

export SCRIPTS_HOME="$HOME/Code/scripts"

# PATH
export PATH="$SCRIPTS_HOME/bash:$PATH"

################################################################################
#                      .NET [https://dotnet.microsoft.com]                     #
################################################################################

export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export DOTNET_ROOT="/usr/share/dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:$SSL_CERT_DIR"

################################################################################
#                           Zig [https://ziglang.org]                          #
################################################################################

export PATH="$ZIG_ROOT:/usr/bin/zig:/usr/bin/zls:$PATH"

################################################################################
#                             Zed [https://zed.dev]                            #
################################################################################

export PATH="$HOME/.local/bin:$PATH"

################################################################################
#                ripgrep [https://github.com/BurntSushi/ripgrep]               #
################################################################################

export RIPGREP_CONFIG_PATH="$CONFIG_HOME/ripgrep/.ripgreprc"

################################################################################
#                     bat [https://github.com/sharkdp/bat]                     #
################################################################################

export BAT_CONFIG_PATH="$CONFIG_HOME/bat/config"

################################################################################
#            Fastfetch [https://github.com/fastfetch-cli/fastfetch]            #
################################################################################

# Custom logo
[[ -f "$CONFIG_HOME/fastfetch/logo.sh" ]] && source "$CONFIG_HOME/fastfetch/logo.sh"

################################################################################
#                      superfile [https://superfile.dev/]                      #
################################################################################

spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

################################################################################
#            MangoHud [https://github.com/flightlessmango/MangoHud]            #
################################################################################

MANGOHUD="1"

################################################################################
#                        Starship [https://starship.rs]                        #
################################################################################

export STARSHIP_CONFIG="$CONFIG_HOME/starship/starship.toml"

eval "$(starship init bash)"

################################################################################
#                Zoxide [https://github.com/ajeetdsouza/zoxide]                #
################################################################################

_ZO_RESOLVE_SYMLINKS="1"

eval "$(zoxide init bash)"
