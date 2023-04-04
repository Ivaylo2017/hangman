#!/bin/bash
# Docker entrypoint script.

# Make sure all dependencies are installed
mix deps.get

# Wait until Postgres is ready
# echo "Testing if Postgres is accepting connections. {$POSTGRES_HOST} {$POSTGRES_PORT} ${POSTGRES_USER}"
# while ! pg_isready -q -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

# Create, migrate, and seed database if it doesn't exist.
# if [[ -z `psql -Atqc "\\list $POSTGRES_DATABASE"` ]]; then
#   echo "Database $POSTGRES_DATABASE does not exist. Creating..."
#   mix ecto.create
#   mix ecto.migrate
#   mix run priv/repo/seeds.exs
#   echo "Database $POSTGRES_DATABASE created."
# fi

# We do not run the server in dev entrypoint so we can start and restart it in
# the devcontainer without needing to close vscode when making config changes
# exec mix phx.server

# So we tail logs so that the container stays running indefinetly
exec tail -f /dev/null
