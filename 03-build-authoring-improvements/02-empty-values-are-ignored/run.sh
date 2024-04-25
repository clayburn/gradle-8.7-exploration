#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir
cd ..

./gradlew addEmptyValueToList printList
./gradlew appendEmptyValueToList printList

popd