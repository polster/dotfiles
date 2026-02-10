#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$0")"
EMULATION_SCRIPT="${SCRIPT_DIR}/docker"
USER_BIN=${HOME}/bin
TARGET_FILE=${USER_BIN}/docker

function error {
    echo -e "$1" >&2
    exit 1
}

# Prerequisite
[[ -z "${USER_BIN}" ]] && error "${USER_BIN} needs to be present, aborting!"

command=$1
if [[ ${command} == "install"  ]]
then
  echo "Installing emulation"
  cp ${EMULATION_SCRIPT} ${TARGET_FILE}
  chmod u+x ${TARGET_FILE}
elif [[ ${command} == "remove"  ]]
then
  echo "Removing emulation"
  rm ${TARGET_FILE}
else
  echo "Invalid command provided, aborting."
  exit 1
fi

echo "Docker CLI: $(which docker)"
