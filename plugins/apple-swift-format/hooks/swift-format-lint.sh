#!/bin/bash
# PreToolUse hook: Lint Swift files with swift-format, deny if lint fails
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

# Run swift-format lint
lint_output=$(/usr/bin/xcrun swift-format lint "$file_path" 2>&1) || {
  echo "swift-format lint failed for $file_path:" >&2
  echo "$lint_output" >&2
  exit 2
}

exit 0
