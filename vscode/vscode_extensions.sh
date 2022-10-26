#!/usr/bin/env bash

# Script dir
SCRIPT_DIR="$(dirname "$0")"
# Extensions file
EXTENSION_FILE="${SCRIPT_DIR}/extensions.txt"

command=$1
if [[ ${command} == "install"  ]]
then
  echo "Installing extensions defined in ${EXTENSION_FILE}"
  cat ${EXTENSION_FILE} | xargs -L 1 code --install-extension
elif [[ ${command} == "dump"  ]]
then
  echo "Dumping installed extensions list into ${EXTENSION_FILE}"
  code --list-extensions > ${EXTENSION_FILE}
else
  echo "Invalid command provided, aborting."
  exit 1
fi
