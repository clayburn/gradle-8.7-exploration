#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Gradle 8.6 redirects standardOutput to System.err"
echo "------------------------------------------------------------"

gradle-8.6 helloWorld

echo "------------------------------------------------------------"
echo "Gradle 8.7 redirects standardOutput to System.err"
echo "------------------------------------------------------------"

./gradlew helloWorld

popd