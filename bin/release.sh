#!/bin/bash

VERSION=$(manage-version update github -o ksespinola -r package-version-test -t $GITHUB_TOKEN)

echo $VERSION

git add package.json


