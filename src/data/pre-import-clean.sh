#!/usr/bin/env bash
cat data/raw/sf-eviction-notices.csv \
    | sed 's/true/1/g' \
    | sed 's/false/0/g' \
    > data/raw/sf-eviction-notices.pre-import-clean.csv
