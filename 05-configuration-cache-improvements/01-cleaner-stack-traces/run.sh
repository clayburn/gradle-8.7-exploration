#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Gradle 8.6 illegal access of project during task execution"
echo "------------------------------------------------------------"

gradle-8.6 printProjectName

echo "------------------------------------------------------------"
echo "Gradle 8.7 illegal access of project during task execution"
echo "------------------------------------------------------------"
./gradlew printProjectName

popd