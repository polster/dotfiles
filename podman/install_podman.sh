#!/usr/bin/env bash

# Check if podman is installed
if ! command -v podman &> /dev/null; then
    echo "podman could not be found. Please install podman first."
    echo "Follow the instructions at https://podman-desktop.io/docs/installation."
    exit 1
else
    echo "podman is already installed."
fi
