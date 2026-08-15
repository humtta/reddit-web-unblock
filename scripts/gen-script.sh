#!/usr/bin/env bash

set -eo pipefail

# Project root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

MANIFEST_FILE="${ROOT_DIR}/src/manifest.json"
JS_FILE="${ROOT_DIR}/src/inject.js"

# Paths relative to the project root directory
ICON_FILE_REL='src/assets/icon.svg'
SCRIPT_FILE_REL='script.user.js'

NAMESPACE='https://github.com/humtta/reddit-web-unblock'

# Get manifest metadata
name="$(jq -r '.name' "${MANIFEST_FILE}")"
description="$(jq -r '.description' "${MANIFEST_FILE}")"
version="$(jq -r '.version' "${MANIFEST_FILE}")"
match="$(jq -r '.content_scripts[0].matches[0]' "${MANIFEST_FILE}")"
run_at="$(jq -r '.content_scripts[0].run_at' "${MANIFEST_FILE}")"
run_at="${run_at//_/-}" # Replace _ with -

# Get JS file content
js="$(<"${JS_FILE}")"

# Generate userscript
cat <<-EOF >"${ROOT_DIR}/${SCRIPT_FILE_REL}"
	// ==UserScript==
	// @name         ${name}
	// @description  ${description}
	// @version      ${version}
	// @author       Hugo Marotta <humtta@proton.me>
	//
	// @copyright    © 2026 Hugo Marotta (https://github.com/humtta)
	// @license      MIT
	//
	// @match        ${match}
	// @grant        none
	// @run-at       ${run_at}
	//
	// @namespace    ${NAMESPACE}
	// @icon         ${NAMESPACE}/raw/main/${ICON_FILE_REL}
	// @updateURL    ${NAMESPACE}/raw/main/${SCRIPT_FILE_REL}
	// @downloadURL  ${NAMESPACE}/raw/main/${SCRIPT_FILE_REL}
	// ==/UserScript==

	${js}
EOF
