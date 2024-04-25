@file:Suppress("UnstableApiUsage")

plugins {
    java
    `jvm-test-suite`
}

repositories {
    mavenCentral()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(22))
    }
}

testing {
    suites {
        val test by getting(JvmTestSuite::class) {
            useJUnitJupiter()
            dependencies {
                implementation(libs.guava)
                implementation("org.checkerframework:checker-qual") {
                    version {
                        strictly("3.42.0")
                    }
                }
            }
        }
    }
}
