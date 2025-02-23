#!/usr/bin/env bash

VERSION_STRING=$1

git add --all
git commit -m "v$VERSION_STRING"
git push -u origin main
