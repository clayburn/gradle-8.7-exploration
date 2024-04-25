#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $script_dir

cd plugin
./gradlew publishToMavenLocal

QUERY='{ variants: [.variants[] | { name: .name, attributes: { "org.gradle.plugin.api-version": .attributes."org.gradle.plugin.api-version" } }] }'
MODULE_DESCRIPTOR=$HOME/.m2/repository/com/example/improved-plugin-application-reporting-plugin/0.1.0/improved-plugin-application-reporting-plugin-0.1.0.module
jq "$QUERY" < $MODULE_DESCRIPTOR

cd ../consumer
gradle-8.6 help
./gradlew help

popd