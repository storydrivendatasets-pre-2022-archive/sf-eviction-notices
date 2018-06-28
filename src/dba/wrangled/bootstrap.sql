#!/usr/bin/env bash
tail -n +4 "$0" | sqlite3
exit $?

-- begin bootstrap
.mode csv
.bail on
.echo on

-- drop/create new tables
.open ./data/processed/sf-evictions.wrangled.sqlite
.read ./src/dba/wrangled/schema.sql

-- import the data
.changes on
.import ./data/raw/sf-eviction-notices.csv notice

-- index the data
.read ./src/dba/wrangled/indexes.sql


-- remove the repeated headers
DELETE FROM notice WHERE "Eviction ID" = 'Eviction ID';
