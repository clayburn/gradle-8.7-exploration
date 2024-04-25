#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo $RANDOM > build/random.txt

rm build/random-symlink.txt
ln -s $script_dir/build/random.txt build/random-symlink.txt

cat build/random-symlink.txt

gradle-8.6 printRandomValue
./gradlew printRandomValue

popd