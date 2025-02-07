#!/bin/bash

set -e  # Exit immediately if a command fails

# Check if the --clean flag is passed
CLEAN_LOCK=false
if [[ "$1" == "--clean" ]]; then
    CLEAN_LOCK=true
fi

# Conditionally remove poetry.lock if --clean is passed
if $CLEAN_LOCK; then
    echo "Removing existing poetry.lock..."
    rm -f poetry.lock
else
    echo "Retaining existing poetry.lock..."
fi

echo "Building the Docker image..."
docker compose build tests

echo "Extracting poetry.lock from the built image..."
docker run --rm polarisadvisor/dashboard-testing:latest cat /poetry.lock > poetry.lock

echo "poetry.lock synced"
