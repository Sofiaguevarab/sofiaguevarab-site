#!/usr/bin/env bash
# Makes clean URLs (sofiaguevarab.cl/work instead of /#work) work on GitHub Pages.
# GitHub Pages serves /work from work.html, so each section gets a copy of index.html.
# Run this after every change to index.html, then commit the generated files too.
set -euo pipefail
cd "$(dirname "$0")"
for v in $(grep -oE 'class="view" data-view="[a-z-]+"' index.html | sed -E 's/.*data-view="([a-z-]+)"/\1/' | grep -vx home); do
  cp index.html "$v.html"
done
cp index.html 404.html
echo "Route pages updated."
