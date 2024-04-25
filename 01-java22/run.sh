#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

echo "------------------------------------------------------------"
echo "Gradle 8.6 build with Java 22 Toolchain"
echo "------------------------------------------------------------"

gradle-8.6 assemble

echo "------------------------------------------------------------"
echo "Gradle 8.7 build with Java 22 Toolchain"
echo "------------------------------------------------------------"

./gradlew assemble

echo "------------------------------------------------------------"
echo "Gradle 8.7 build with Java 22 Runtime"
echo "------------------------------------------------------------"

cd ../armeria
JAVA_HOME=$(asdf where java liberica-22.0.1+10)
./gradlew assemble
JAVA_HOME=$(asdf where java 21)

popd