###############################################################################
#                                    General                                   #
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
source "$HOME/.bash_aliases"

# GPG key
export GPG_TTY="$(tty)"

# OpenSSL
export SSL_CERT_DIR="/usr/lib/ssl/certs:/etc/ssl/certs"

################################################################################
#                      .NET [https://dotnet.microsoft.com]                     #
################################################################################

export DOTNET_CLI_TELEMETRY_OPTOUT="1"
export DOTNET_ROOT="/usr/share/dotnet"
export DOTNET_TOOLS_PATH="$DOTNET_ROOT/tools"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_TOOLS_PATH"
export SSL_CERT_DIR="$SSL_CERT_DIR:$HOME/.aspnet/dev-certs/trust"

################################################################################
#                ripgrep [https://github.com/BurntSushi/ripgrep]               #
################################################################################

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

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
#                     fzf [https://junegunn.github.io/fzf]                     #
################################################################################

eval "$(fzf --bash)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--style minimal"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always --group-directories-first {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type=directory --hidden --follow --exclude ".git" . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --level=2 --color=always --show-directories-first {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)
        fzf --preview "eza --tree --level=2 --color=always --group-directories-first {} | head -200" "$@" ;;
    export|unset)
        fzf --preview "eval 'echo $'{}" "$@" ;;
    ssh)
        fzf --preview "dig {}" "$@" ;;
    *)
        fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

################################################################################
#            bash-preexec [https://github.com/rcaloras/bash-preexec]           #
################################################################################

# Enable experimental subshell support
export __bp_enable_subshells="true"

[[ -f ~/.bash-preexec.sh ]] && source "$HOME/.bash-preexec.sh"

################################################################################
#                           Atuin [https://atuin.sh]                           #
################################################################################

export ATUIN_CONFIG_DIR="$HOME/.config/atuin"

eval "$(atuin init --disable-up-arrow bash)"

################################################################################
#                        Starship [https://starship.rs]                        #
################################################################################

eval "$(starship init bash)"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

################################################################################
#                Zoxide [https://github.com/ajeetdsouza/zoxide]                #
################################################################################

eval "$(zoxide init bash)"

