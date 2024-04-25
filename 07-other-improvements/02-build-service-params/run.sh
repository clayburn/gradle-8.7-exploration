#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

idea diff gradle-8.6/build.gradle.kts gradle-8.7/build.gradle.kts

echo "------------------------------------------------------------"
echo "Gradle 8.6 build service with empty params"
echo "------------------------------------------------------------"

cd gradle-8.6
./gradlew buildServiceParams

echo "------------------------------------------------------------"
echo "Gradle 8.7 build service with no empty params"
echo "------------------------------------------------------------"

cd ../gradle-8.7
./gradlew buildServiceParams

popd