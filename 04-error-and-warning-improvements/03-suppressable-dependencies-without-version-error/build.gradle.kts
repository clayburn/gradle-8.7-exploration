plugins {
    java
    `maven-publish`
    id("java-gradle-plugin")
    id("com.gradle.plugin-publish") version "1.2.1"
}

group = "com.example"
version = "0.1.0"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.test:test")
    implementation(libs.guava)
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

if (hasProperty("suppressMissingDependencyVersions")) {
    tasks.withType<(GenerateModuleMetadata)>().configureEach {
        suppressedValidationErrors.add("dependencies-without-versions")
    }
}
