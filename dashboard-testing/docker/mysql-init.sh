#!/bin/bash
set -e

echo "Checking if the database has already been initialized..."

# Check if the schema has already been restored
if [ ! -f "/var/lib/mysql/schema_initialized" ]; then
    echo "Restoring schema from schema.sql..."
    cat /docker-entrypoint-initdb.d/schema.sql | mysql -u root -proot lake
    touch /var/lib/mysql/schema_initialized
    echo "Schema restoration complete!"
else
    echo "Schema already initialized. Skipping restore."
fi
