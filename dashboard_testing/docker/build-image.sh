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
docker buildx build . \
            --file docker/Dockerfile \
            --platform linux/amd64,linux/arm64 \
            --tag polarisadvisor/dashboard-testing:latest \
            --tag polarisadvisor/dashboard-testing:$(git rev-parse --short HEAD) \
            --push

echo "Extracting poetry.lock from the built image..."
docker run --rm polarisadvisor/dashboard-testing:latest cat /poetry.lock > poetry.lock

echo "poetry.lock synced"
