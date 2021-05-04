#!/bin/bash

# Formatting current date time as "yyyy-MM-dd HH:mm:ss".
NOW=$(date +"%Y-%m-%d %T")

# Git hook name, do not edit this.
HOOK_NAME="commit-msg"

TRIGGER=(
  "# Created by ImSejin (https://github.com/imsejin)"
  "# Created at ${NOW}"
  ""
  '. "$(dirname "$0")/commit-message-converter.sh"'
)

# Creates a hook file, if doesn't exist.
if [ ! -f .git/hooks/${HOOK_NAME} ]; then
  # Writes shebang.
  echo "#"'!'"/bin/bash" > .git/hooks/${HOOK_NAME}
  chmod +x .git/hooks/${HOOK_NAME}
fi

# Append to hook file if doesn't exist, creates it.
echo >> .git/hooks/${HOOK_NAME}
printf "%s\n" "${TRIGGER[@]}" >> .git/hooks/${HOOK_NAME}

# Creates a script file.
CONTENT=(
  "# Created by ImSejin (https://github.com/imsejin)"
  "# Created at ${NOW}"
  ""
)

printf "%s\n" "${CONTENT[@]}" > .git/hooks/commit-message-converter.sh
chmod +x .git/hooks/commit-message-converter.sh
URL="https://raw.githubusercontent.com/ImSejin/git-commit-message-converter/main/commit-message-converter.sh"
curl -ksL ${URL} >> .git/hooks/commit-message-converter.sh
