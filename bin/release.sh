#!/bin/bash

VERSION=${/opt/circleci/nodejs/v7.3.0/bin/node --harmony
/opt/circleci/nodejs/v7.3.0/lib/node_modules/manage-version/manage-version update github -o ksespinola -r
package-version-test -t $GITHUB_TOKEN}

echo $VERSION

git add package.json

git commit -m '[CI SKIP] update package version'

git push origin master
