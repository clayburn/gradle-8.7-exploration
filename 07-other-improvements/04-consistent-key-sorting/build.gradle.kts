@file:Suppress("UnstableApiUsage")

plugins {
    java
    `jvm-test-suite`
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(libs.guava)
    implementation(libs.commons)
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(22))
    }
}
