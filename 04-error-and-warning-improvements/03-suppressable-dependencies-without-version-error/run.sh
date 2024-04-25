#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Don't suppress missing dependency versions when generating metadata file for plugin maven publication"
echo "------------------------------------------------------------"
./gradlew generateMetadataFileForPluginMavenPublication

echo "------------------------------------------------------------"
echo "Suppress missing dependency versions when generating metadata file for plugin maven publication"
echo "------------------------------------------------------------"
./gradlew generateMetadataFileForPluginMavenPublication -PsuppressMissingDependencyVersions

popd