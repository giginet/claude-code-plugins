#!/bin/bash
# PostToolUse hook: Auto-format Swift files with swift-format
set -euo pipefail

input=$(cat)

# Only run when .swift-format exists in cwd
if [ ! -f ".swift-format" ]; then
  exit 0
fi

file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')

# Only process .swift files
if [[ "$file_path" != *.swift ]]; then
  exit 0
fi

# Only process existing files
if [ ! -f "$file_path" ]; then
  exit 0
fi

/usr/bin/xcrun swift-format format --in-place "$file_path" 2>/dev/null

exit 0
