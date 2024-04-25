#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Gradle 8.6 Copy without improved error reporting"
echo "------------------------------------------------------------"
gradle-8.6 clean copy

echo "------------------------------------------------------------"
echo "Gradle 8.7 Copy with improved error reporting"
echo "------------------------------------------------------------"
./gradlew clean copy

popd