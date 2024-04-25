#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

idea diff gradle-8.6/build.gradle.kts gradle-8.7/build.gradle.kts

cd gradle-8.6
./gradlew buildServiceParams
cd ../gradle-8.7
./gradlew buildServiceParams

popd