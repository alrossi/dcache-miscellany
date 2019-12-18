#!/bin/sh

set -e

if [ $# -lt 1 -o $# -gt 3 ]; then
    echo "$0 BRANCH [COMMIT] [RB]"
    exit 1
fi

branch="$1"
if [ $# -eq 2 ]; then
  commit="$2"
else
  commit="$(git rev-parse HEAD)"
fi

if [ $# -eq 3 ]; then
  rb="$3"
else
  rb=$(git log $commit -1 --format=%b|sed -n -e 's;^Patch: https://rb.dcache.org/r/\([0-9]*\)/$;\1;p')
fi

if [ -z "$rb" ]; then
    echo "$commit lacks a patch reference."
    exit 1
fi

git checkout $branch
git pull origin $branch
git checkout -b fix/$branch/rb$rb
git cherry-pick -x $commit
git push behrmann HEAD
hub pull-request -b $branch
git checkout master
