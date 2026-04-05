#!/bin/bash
cat > /dev/null
FLAG="/tmp/.plannotator-openspec-pending"
[ -f "$FLAG" ] || exit 0
CHANGE_DIR=$(cat "$FLAG")
rm -f "$FLAG"
[ -d "$CHANGE_DIR" ] || exit 0
PROJECT=$(basename "$(cd "$CHANGE_DIR/../.." && pwd)")
EXISTING_URL=$(plannotator sessions 2>/dev/null | grep "annotate.*$PROJECT" | head -1 | grep -oE 'http://localhost:[0-9]+')
if [ -n "$EXISTING_URL" ] && curl -s --connect-timeout 1 "$EXISTING_URL" > /dev/null 2>&1; then
    open "$EXISTING_URL"
else
    exec plannotator annotate "$CHANGE_DIR/"
fi
