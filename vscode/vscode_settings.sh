#!/usr/bin/env bash

# Script dir
SCRIPT_DIR="$(dirname "$0")"
# Shared base settings (committed)
BASE_SETTINGS="${SCRIPT_DIR}/settings.json"
# Private local settings (not committed)
LOCAL_SETTINGS="${VSCODE_LOCAL_SETTINGS:-${HOME}/.config/vscode/settings.local.json}"
# VSCode user settings
USER_SETTINGS="${HOME}/Library/Application Support/Code/User/settings.json"

error() {
  echo "$1"
  exit 1
}

command -v jq > /dev/null || error "jq is required, aborting."

merge_settings() {
  if [[ -f "${LOCAL_SETTINGS}" ]]
  then
    jq -s '.[0] * .[1]' "${BASE_SETTINGS}" "${LOCAL_SETTINGS}"
  else
    jq '.' "${BASE_SETTINGS}"
  fi
}

command=$1
if [[ ${command} == "install" ]]
then
  echo "Installing merged settings from ${BASE_SETTINGS} and ${LOCAL_SETTINGS} into ${USER_SETTINGS}"
  MERGED="$(merge_settings)" || error "Failed to merge settings, aborting."
  mkdir -p "$(dirname "${USER_SETTINGS}")"
  if [[ -f "${USER_SETTINGS}" ]]
  then
    cp "${USER_SETTINGS}" "${USER_SETTINGS}.bak"
  fi
  echo "${MERGED}" > "${USER_SETTINGS}"
elif [[ ${command} == "diff" ]]
then
  [[ -f "${USER_SETTINGS}" ]] || error "No settings found at ${USER_SETTINGS}, aborting."
  diff -u <(merge_settings | jq -S '.') <(jq -S '.' "${USER_SETTINGS}") \
    --label "merged" --label "${USER_SETTINGS}"
else
  echo "Invalid command provided, aborting."
  exit 1
fi
