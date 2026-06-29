#!/usr/bin/env bash

# Check if npx is installed
if ! command -v npx &> /dev/null; then
    echo "npx could not be found. Please install Node.js and npm first."
    exit 1
fi

npx -y @maximhq/bifrost-cli
