#!/usr/bin/env bash
tail -n +4 "$0" | sqlite3
exit $?

-- begin bootstrap
.mode csv
.bail on
.echo on

-- drop/create new tables
.open ./data/processed/sf-evictions.vanilla.sqlite
.read ./src/dba/vanilla/schema.sql

-- import the data
.changes on
.import ./data/raw/sf-eviction-notices.csv notice

-- index the data
.read ./src/dba/vanilla/indexes.sql


-- remove the repeated headers
DELETE FROM notice WHERE "Eviction ID" = 'Eviction ID';
