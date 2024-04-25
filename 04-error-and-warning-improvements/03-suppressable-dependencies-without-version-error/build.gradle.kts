plugins {
    java
    `maven-publish`
}

group = "com.example"
version = "0.1.0"

publishing {
    publications.create<MavenPublication>("library").from(components["java"])
    repositories.maven("repo")
}

val internal = configurations.dependencyScope("internal").get()
sourceSets.all {
    configurations[compileClasspathConfigurationName].extendsFrom(internal)
    configurations[runtimeClasspathConfigurationName].extendsFrom(internal)
    configurations[annotationProcessorConfigurationName].extendsFrom(internal)
}

dependencies {
    // Use Spring Boot Platform, but imagine a company internal platform
    // Internal users are assumed to always select a platform version

    if (hasProperty("externalizePlatformDependency")) {
        implementation(platform("org.springframework.boot:spring-boot-dependencies:3.2.4"))
    } else {
        internal(platform("org.springframework.boot:spring-boot-dependencies:3.2.4"))
    }

    implementation("org.apache.commons:commons-lang3")
    implementation("org.apache.commons:commons-pool2")
}

//repositories {
//    mavenCentral()
//}
//
//dependencies {
//    implementation("org.test:test")
//}
//
//java {
//    toolchain {
//        languageVersion = JavaLanguageVersion.of(21)
//    }
//}
//
if (hasProperty("suppressMissingDependencyVersions")) {
    tasks.withType<(GenerateModuleMetadata)>().configureEach {
        suppressedValidationErrors.add("dependencies-without-versions")
    }
}
