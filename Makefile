PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BUCKET = [OPTIONAL] your-bucket-for-syncing-data (do not include 's3://')
PROFILE = default
PROJECT_NAME = sf-eviction-notices
PYTHON_INTERPRETER = python3

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
endif

############
# Data files
############
./data/raw/sf-eviction-notices.csv:
	./src/data/fetch_raw.sh

./data/raw/sf-eviction-notices.pre-import-clean.csv:
	./src/data/pre-import-clean.sh

./data/processed/sf-evictions.vanilla.sqlite:
	./src/dba/vanilla/bootstrap.sql



#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Fetching the raw stuff
fetch_raw_data:
	@echo "fetch-raw.sh: Downloading raw data"
	./src/data/fetch-raw.sh

clean_raw_data:
	@echo "pre-import-clean.sh:\n   Making quick-fixes to raw data before the SQL import"
	./src/data/pre-import-clean.sh

## Database stuff
bootstrap_vanila_db: ./data/raw/sf-eviction-notices.pre-import-clean.csv
	./src/dba/vanilla/bootstrap.sql


bootstrap_wrangled_db:
	./src/dba/wrangled/bootstrap.sql
