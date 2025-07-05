#!/bin/bash

set -e  # Exit immediately if any command fails

# Get the root directory of the Git project
PROJECT_DIR=$(git rev-parse --show-toplevel)

conda env create -f "$PROJECT_DIR/environment.yml" || conda env update -f "$PROJECT_DIR/environment.yml"
