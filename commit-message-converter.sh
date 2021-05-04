COMMIT_MSG=$(cat "${1:?Missing commit message file}")

# Gets keyword in the commit message.
# {keyword}|{commit message}
OLDIFS=$IFS
IFS='|'
read -r -a ARRAY <<< ${COMMIT_MSG}
KEYWORD=${ARRAY[0]}
IFS=$OLDIFS

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname $(dirname ${CURRENT_DIR}))"

# ../../.commit-msg-templates
FILE_DIR=${REPO_DIR}/.commit-msg-templates

# Reads a file ".commit-msg-templates".
[ ! -f ${FILE_DIR} ] && { echo "File not found: ${FILE_DIR}"; exit 99; }

OLDIFS=$IFS
IFS=','
# sed 1d ${FILE_DIR} | while read keyword gitmoji type # This run in a subshell.
while read keyword gitmoji type
do
  if [ ${KEYWORD} == ${keyword} ]; then
    declare -A object=(
      [keyword]=${keyword}
      [gitmoji]=${gitmoji}
      [type]=${type}
    )
	
	break;
  fi  
done <<< $(sed 1d ${FILE_DIR}) # Run in a mainshell.
IFS=$OLDIFS

# echo keyword, ${object[keyword]}
# echo gitmoji, ${object[gitmoji]}
# echo type, ${object[type]}

# Checks if keyword is matched.
[ -z ${object[keyword]} ] && {
  echo "Undefined commit keyword: ${KEYWORD}"
  echo "Add it into ${FILE_DIR}"
  exit 1
}

# Manipulates commit message.
git commit --amend -m "${object[gitmoji]} ${object[type]}: ${ARRAY[1]}"

exit 0
