#!/usr/bin/env bash

set -eo pipefail

# Project root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

MANIFEST_FILE="${ROOT_DIR}/src/manifest.json"
JS_FILE="${ROOT_DIR}/src/inject.js"

# Paths relative to the project root directory
ICON_FILE_REL="src/assets/icon.svg"
SCRIPT_FILE_REL="script.user.js"
