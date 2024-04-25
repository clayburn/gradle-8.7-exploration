#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Publish with platform metatdata included"
echo "------------------------------------------------------------"
./gradlew publish -PexternalizePlatformDependency
QUERY='.variants[] | select(.name == "runtimeElements")'
MODULE_DESCRIPTOR=repo/com/example/suppressable-dependencies-without-version-error/0.1.0/suppressable-dependencies-without-version-error-0.1.0.module
jq "$QUERY" < $MODULE_DESCRIPTOR

echo "------------------------------------------------------------"
echo "Don't suppress missing dependency versions when generating metadata file for plugin maven publication"
echo "------------------------------------------------------------"

./gradlew publish

echo "------------------------------------------------------------"
echo "Suppress missing dependency versions when generating metadata file for plugin maven publication"
echo "------------------------------------------------------------"

./gradlew publish -PsuppressMissingDependencyVersions

jq "$QUERY" < $MODULE_DESCRIPTOR

popd