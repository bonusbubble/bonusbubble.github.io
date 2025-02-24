#!/usr/bin/env bash

VERSION=$1

ifndef VERSION
    $(error VERSION is undefined)
endif

VERSION_TAG="v$VERSION"

git add --all
git commit -m "$VERSION"
git tag -a $VERSION_TAG -m "$VERSION"
