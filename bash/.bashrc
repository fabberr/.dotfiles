# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# The following  variables aren't officially supported by Bash, and thus won't
# change its behavior in any way. Instead, they are provided as convenience for
# other scripts/functions in this environment.

export __BASH_CONFIG_HOME="$HOME/.config/bash"

export __BASH_ENVIRONMENT_PATH="$__BASH_CONFIG_HOME/environment.bash"
export __BASH_ALIASES_PATH="$__BASH_CONFIG_HOME/aliases.bash"
export __BASH_FUNCTIONS_PATH="$__BASH_CONFIG_HOME/functions.bash"

export __BASH_MODULES_MANIFEST_PATH="$__BASH_CONFIG_HOME/.modules_manifest"
export __BASH_MODULES_HOME="$__BASH_CONFIG_HOME/modules"

# Required configuration files

source "$__BASH_ENVIRONMENT_PATH"
source "$__BASH_ALIASES_PATH"
source "$__BASH_FUNCTIONS_PATH"

# Optional configuration modules

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" ]] && continue

    mdolue_name="$line"
    module_path="$__BASH_MODULES_HOME/$mdolue_name.bash"

    [[ -r "$module_path" ]] || continue

    source "$module_path"
done < "$__BASH_MODULES_MANIFEST_PATH"
