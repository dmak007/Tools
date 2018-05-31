#!/bin/sh

get_clean_message() {
  egrep -o '^[^#].*' "$1"
}

# Do not allow empty messages after removing comments
[ -z "$(get_clean_message "$1")" ] && {
  echo >&2 Commit message cannot be empty.
  exit 1
}

# Prepend to message Jira issues found in branch name but not found within message
JIRAS_IN_BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD | egrep -io '\b[a-z]{3,}-[1-9][0-9]*\b')"
for JIRA in ${JIRAS_IN_BRANCH_NAME}; do
  get_clean_message "$1" | egrep "\b${JIRA}\b" || sed -i -e "1s/^/${JIRA}, /" "$1"
done
[ ! -z "${JIRAS_IN_BRANCH_NAME}" ] && exit 0

# Branch names without Jira issues found in their name must have at leat one issue in their message
get_clean_message "$1" | egrep -qi '\b[a-z]{3,}-[1-9][0-9]*\b' || {
  echo >&2 Commit message requires JIRA code.
  exit 1
}
