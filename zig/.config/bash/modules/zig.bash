command -v zig > /dev/null 2>&1 || return

################################## Environment #################################

export PATH="$ZIG_ROOT:/usr/bin/zig:/usr/bin/zls:$PATH"
