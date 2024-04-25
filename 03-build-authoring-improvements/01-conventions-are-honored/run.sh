#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir
cd ..

echo "------------------------------------------------------------"
echo "Add an item value to the list"
echo "------------------------------------------------------------"
./gradlew addItemToList

echo "------------------------------------------------------------"
echo "Append an item value to the list"
echo "------------------------------------------------------------"
./gradlew appendItemToList

popd