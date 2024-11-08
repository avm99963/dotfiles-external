#!/usr/bin/env bash
# Adapted from https://gist.github.com/thoughtpolice/8f2fd36ae17cd11b8e7bd93a70e31ad6

set -euo pipefail

CID=$(jj log --no-graph -r @ -T "change_id" | sha256sum | head -c 40)

CHGSTR="Change-Id: I${CID}"

contents=$(<"$1")
readarray -t lines <<<"$contents"

body=''
last=''
for x in "${lines[@]}"; do
  [[ "$x" =~ ^"JJ:" ]] && continue
  [[ "$x" =~ ^"Change-Id:" ]] && continue

  [[ "$x" == '' ]] && [[ "$last" == '' ]] && continue

  last="$x"
  body+="$x\n"
done

body+="$CHGSTR\n"

if [[ "$body" == "$CHGSTR\n" ]]; then
  body="\n\n$body"
fi

t=$(mktemp)
printf "$body" > "$t"
mv "$t" "$1"

exec nvim "$1"
