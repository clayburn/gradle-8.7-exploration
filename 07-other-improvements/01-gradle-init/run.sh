#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

rm -rf build/gradle-8.6-init build/gradle-8.7-init
mkdir -p build/gradle-8.6-init build/gradle-8.7-init

echo "------------------------------------------------------------"
echo "Gradle 8.6 init"
echo "------------------------------------------------------------"

gradle-8.6 init --use-defaults --type kotlin-library -p build/gradle-8.6-init

echo "------------------------------------------------------------"
echo "Gradle 8.7 init with --no-comments"
echo "------------------------------------------------------------"

gradle init --use-defaults --type kotlin-library -p build/gradle-8.7-init --no-comments

idea diff build/gradle-8.6-init build/gradle-8.7-init

popd