#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Generate new random value in symlinked file"
echo "------------------------------------------------------------"

echo $RANDOM > build/random.txt

rm build/random-symlink.txt
ln -s $script_dir/build/random.txt build/random-symlink.txt

cat build/random-symlink.txt

echo "------------------------------------------------------------"
echo "Gradle 8.6 print contents of random file via symlinked file"
echo "------------------------------------------------------------"
gradle-8.6 printRandomValue

echo "------------------------------------------------------------"
echo "Gradle 8.7 print contents of random file via symlinked file"
echo "------------------------------------------------------------"
./gradlew printRandomValue

popd