#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  <<-EOSQL
    CREATE USER tc_user with encrypted password '$POSTGRES_PASSWORD';
    CREATE DATABASE teamcity;
    GRANT ALL PRIVILEGES ON DATABASE teamcity TO tc_user;
EOSQL