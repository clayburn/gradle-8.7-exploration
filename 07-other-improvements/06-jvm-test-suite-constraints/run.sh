#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

idea diff gradle-8.6/build.gradle.kts gradle-8.7/build.gradle.kts

echo "------------------------------------------------------------"
echo "Gradle 8.6 with jvm test suite dependency constraints"
echo "------------------------------------------------------------"

cd gradle-8.6
./gradlew build

echo "------------------------------------------------------------"
echo "Gradle 8.7 with jvm test suite dependency constraints"
echo "------------------------------------------------------------"

cd ../gradle-8.7
./gradlew build

popd