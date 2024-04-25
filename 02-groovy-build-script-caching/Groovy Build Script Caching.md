# Groovy Build Script Caching

Avoiding Groovy build script compilation thanks to build cache support
The Gradle build cache is a mechanism designed to save time by reusing local or remote outputs from previous builds.

In this release, Groovy build script compilation can benefit from the remote build cache, which, when enabled, reduces initial build times for developers by avoiding this step altogether.

While this feature has been available for Kotlin build script compilation since the introduction of the Kotlin DSL in Gradle 5.0, the Groovy DSL lacked this feature parity.

## Example

```shell
./run.sh
```