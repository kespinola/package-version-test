#!/bin/bash

VERSION=$(manage-version update github -o ksespinola -r package-version-test -t $GITHUB_TOKEN)

git add package.json

git commit "[CI SKIP] version updated to $VERSION"

git push origin master

curl -H "Authorization: token $GITHUB_TOKEN" --data
"tag_name=${VERSION}&name=Release ${VERSION}&body=${CI_PULL_REQUEST}"
-x POST https://api.github.com/repos/ksespinola/package-version-test/releases

