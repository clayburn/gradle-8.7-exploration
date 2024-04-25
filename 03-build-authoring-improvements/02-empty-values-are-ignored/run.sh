#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir
cd ..

echo "------------------------------------------------------------"
echo "Add an empty value to the list"
echo "------------------------------------------------------------"
./gradlew addEmptyValueToList

echo "------------------------------------------------------------"
echo "Append an empty value to the list"
echo "------------------------------------------------------------"
./gradlew appendEmptyValueToList

popd