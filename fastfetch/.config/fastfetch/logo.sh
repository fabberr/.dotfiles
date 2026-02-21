fastfetch_datapath="${HOME}/.local/share/fastfetch"
fastfetch_logo_filename="twilight.txt"

fastfetch_logo="${fastfetch_datapath}/${fastfetch_logo_filename}"

[[ -f "${fastfetch_logo}" ]] && export FASTFETCH_LOGO="${fastfetch_logo}"
