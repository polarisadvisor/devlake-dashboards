#!/bin/bash

# Wait for MySQL to be ready
echo "Waiting for MySQL to start..."
until mysqladmin ping -h "mysql" --silent; do
    sleep 2
done

# Debugging: Check if pytest is installed system-wide
echo "PATH: $PATH"
echo "pytest location: $(which pytest)"

# Run tests
echo "Running tests..."
pytest --maxfail=1 --disable-warnings