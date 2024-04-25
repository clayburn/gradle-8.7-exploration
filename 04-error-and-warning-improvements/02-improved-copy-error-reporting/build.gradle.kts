plugins {
    base
    `java-library`
}

repositories {
    mavenCentral()
}

val someConfiguration by configurations.creating

dependencies {
    someConfiguration("com.google.code.findbugs:jsr305:3.0.2")
}

tasks.register<Copy>("copy") {
    duplicatesStrategy = DuplicatesStrategy.FAIL
    from(zipTree(someConfiguration.singleFile))
    from(project.layout.projectDirectory.dir("src/main/resources"))
    into(project.layout.buildDirectory)
}