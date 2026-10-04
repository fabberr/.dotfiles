command -v dotnet > /dev/null 2>&1 || return

################################## Environment #################################

export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export DOTNET_ROOT="/usr/share/dotnet"

export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:$SSL_CERT_DIR"

export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
