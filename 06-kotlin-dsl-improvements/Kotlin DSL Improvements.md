# Kotlin DSL Improvements

## Embedded Kotlin upgrade to 1.9.22

The embedded Kotlin has been updated from 1.9.10 to Kotlin 1.9.22.

Details for these releases can be found at: https://kotlinlang.org/docs/releases.html#release-details

## Kotlin DSL Reference update

Javadocs generated from Java code now support a "since" section, indicating the Gradle version when the functionality was introduced.

The information comes from the @since tags in the Javadoc, which haven’t been displayed until now. An example can be found at: 
- [JavaToolchainSpec (Gradle 8.6)](https://docs.gradle.org/8.6/kotlin-dsl/gradle/org.gradle.jvm.toolchain/-java-toolchain-spec/index.html)
- [JavaToolchainSpec (Gradle 8.7)](https://docs.gradle.org/8.7/kotlin-dsl/gradle/org.gradle.jvm.toolchain/-java-toolchain-spec/index.html)
