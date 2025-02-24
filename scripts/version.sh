#!/usr/bin/env bash

version="$1"

if [ -z ${version} ]; then
    echo version is undefined
    exit 1
fi

version_tag="v$version"

git add --all
git commit -m "$version"
git tag -a $version_tag -m "$version"
