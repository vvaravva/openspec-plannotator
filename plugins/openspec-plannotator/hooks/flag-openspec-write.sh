#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null)
if [[ "$FILE_PATH" == *"/openspec/changes/"* ]]; then
    CHANGE_DIR=$(echo "$FILE_PATH" | sed 's|\(.*/openspec/changes/[^/]*\)/.*|\1|')
    echo "$CHANGE_DIR" > /tmp/.plannotator-openspec-pending
fi
