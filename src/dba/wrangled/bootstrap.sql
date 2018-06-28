#!/usr/bin/env bash
tail -n +4 "$0" | sqlite3
exit $?

-- This should create new db if it doesn't already exist
ATTACH DATABASE
    './data/processed/sf-evictions.wrangled.sqlite'
    AS wrangled;

-- drop/create new tables
.read ./src/dba/wrangled/schema.sql

ATTACH DATABASE
    './data/processed/sf-evictions.vanilla.sqlite'
    AS vanilla;

-- import the data
.changes on
.read ./src/dba/wrangled/extract-inserts.sql

DETACH DATABASE vanilla;
DETACH DATABASE wrangled;

-- index the data
.open './data/processed/sf-evictions.wrangled.sqlite'
.read ./src/dba/wrangled/indexes.sql
