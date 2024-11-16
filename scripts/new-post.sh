#!/bin/bash

set -euo pipefail

[[ -z "$1" ]] && { echo "Give title pls" ; exit 1; }

TITLE="${@:1}"
SLUG="$(echo "$TITLE" | tr ' ' '-' )"

ROOT_DIR=$(git rev-parse --show-toplevel)

TEMPLATE=$(cat <<-END

+++
title = "$TITLE"
date = $(date -Is --utc | cut -d'+' -f1)

[extra]
author = "Victor Viale"

[taxonomies]
tags = []
+++

END
)

FILE_NAME="$(date '+%Y%m%d')-$SLUG.md"
echo "$TEMPLATE" > "$ROOT_DIR/content/$FILE_NAME"
