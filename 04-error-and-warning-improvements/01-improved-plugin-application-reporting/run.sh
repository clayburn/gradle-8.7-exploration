#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir


echo "------------------------------------------------------------"
echo "Publishing a plugin that requires Gradle 42.0"
echo "------------------------------------------------------------"

cd plugin
./gradlew publishToMavenLocal

QUERY='{ variants: [.variants[] | { name: .name, attributes: { "org.gradle.plugin.api-version": .attributes."org.gradle.plugin.api-version" } }] }'
MODULE_DESCRIPTOR=$HOME/.m2/repository/com/example/improved-plugin-application-reporting-plugin/0.1.0/improved-plugin-application-reporting-plugin-0.1.0.module
jq "$QUERY" < $MODULE_DESCRIPTOR

cd ../consumer

echo "------------------------------------------------------------"
echo "Gradle 8.6 attempts to use plugin requiring Gradle 42.0"
echo "------------------------------------------------------------"

gradle-8.6 help

echo "------------------------------------------------------------"
echo "Gradle 8.7 attempts to use plugin requiring Gradle 42.0"
echo "------------------------------------------------------------"

./gradlew help

popd