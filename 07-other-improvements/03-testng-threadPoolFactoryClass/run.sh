#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "TestNG execution with custom threadPoolFactoryClass"
echo "------------------------------------------------------------"

./gradlew check

popd