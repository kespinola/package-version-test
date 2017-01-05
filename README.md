# Package Version Test
[![Develop Status](https://circleci.com/gh/ksespinola/package-version-test.png?circle-token=9bbfc3d5d29d851f695f02ca49d3de9d56ae7943)](https://circleci.com/gh/ksespinola/package-version-test/tree/develop)
This repo provides a possible means of introducing automated semver versioning based on the last branch merged
into `develop`.

## Steps
1. Merge branch into `develop` from github with a label of `bug`, `feature`, or `breaking`
2. The `candidate` deployment strategy on circle updates the package.json version based on the label of the branch just
   merged. [`manage-version`](https://github.com/procore/package-version) performs the update. 
3. Commit and push the version update to `develop`.
4. Checkout `master` and merge `develop`.
5. Push `master` to `origin`.
6. The `release` deployment strategy is triggered from the push to master. 
7. The `npm run webpack:build` reads the new package version for the build and distro to aws eg
   `s3://<bucket>/releases/1.9.1`.
