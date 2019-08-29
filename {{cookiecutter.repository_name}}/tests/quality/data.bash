readarray -t scripts < <(find bin -type f 2>/dev/null || true)
readarray -t libs < <(find lib -name '*.sh' 2>/dev/null || true)

success=0
failure=1
