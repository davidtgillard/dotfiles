#!/bin/env bash


HEAD="$(git rev-parse HEAD)"

usage="Usage: $(basename "$0") BRANCH"

if [ -z "$1" ]; then
  echo "$usage" 1>&2
  echo "must specify branch" 1>&2
  exit 1
fi


if git merge "$1"; then
  echo "$usage" 1>&2
  echo "merge failed" 1>&2
  exit 1
fi


if git reset --soft "$HEAD"; then
  echo "$usage" 1>&2
  echo "git soft reset failed" 1>&2
  exit 1
fi
git commit
echo "$HEAD"
