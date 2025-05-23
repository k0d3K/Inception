#!/bin/bash
set -e

# If there’s a template SQL, substitute env vars into it and then remove it
if [ -f /entrypoint-initdb.d/init.sql.template ]; then
  envsubst < /entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
  rm /entrypoint-initdb.d/init.sql.template
fi

# Exec whatever was passed (this hooks into the official MariaDB entrypoint)
exec "$@"
