#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SEARCH_DIRS=("$REPO_ROOT/en" "$REPO_ROOT/ko")

if ! command -v rg >/dev/null 2>&1; then
  echo "Error: rg (ripgrep) is required for link checks."
  exit 1
fi

LINKS="$(
  rg -No --no-filename 'href="/(en|ko)/[^"]+"' "${SEARCH_DIRS[@]}" \
    | sed -E 's/^href="([^"]+)"$/\1/' \
    | sed -E 's/[?#].*$//' \
    | sed -E 's:/$::' \
    | sort -u
)"

if [[ -z "$LINKS" ]]; then
  echo "No internal /en or /ko href links found."
  exit 0
fi

BROKEN=0
COUNT=0
while IFS= read -r LINK; do
  [[ -z "$LINK" ]] && continue
  COUNT=$((COUNT + 1))
  TARGET_MDX="$REPO_ROOT${LINK}.mdx"
  TARGET_MD="$REPO_ROOT${LINK}.md"
  if [[ ! -f "$TARGET_MDX" && ! -f "$TARGET_MD" ]]; then
    echo "Broken internal link: $LINK"
    echo "  Expected one of:"
    echo "  - $TARGET_MDX"
    echo "  - $TARGET_MD"
    BROKEN=1
  fi
done <<< "$LINKS"

if [[ $BROKEN -ne 0 ]]; then
  echo "Internal link check failed."
  exit 1
fi

echo "Internal link check passed (${COUNT} unique links)."
