# YouTube Video Streaming
yt() {
    local video_url=$1
    local output_format="mkv"
    local browser="vivaldi"

    # Create temporary directory to store the output files from yt-dlp
    local tmpdir
    tmpdir=$(mktemp -d) || {
        echo "Unable to create temporary directory." >&2
        return 1
    }

    echo "Using temporary directory: $tmpdir"

    # Ensure $tmpdir is cleaned up
    trap 'rm -rf -- "$tmpdir"' EXIT

    local output_path="$tmpdir/video.$output_format"

    echo "Downloading to: $output_path"

    # Download
    # TODO: select video quality - define an upper bound by passing an argument maybe?
    #       e.g. --quality=1440p
    yt-dlp "$video_url" \
        --cookies-from-browser $browser \
        --format "bestvideo*+bestaudio/best" \
        --merge-output-format "$output_format" \
        --output "$output_path" || {
            echo "Unable to download video." >&2
            return 1
        }

    if [[! -f "$output_path" ]]; then
        echo "Unable to access output file: $output_path" >&2
        return 1

    fi

    vlc --start-paused "$output_path"
}
