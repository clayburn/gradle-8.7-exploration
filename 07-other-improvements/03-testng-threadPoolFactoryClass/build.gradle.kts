@file:Suppress("UnstableApiUsage")

plugins {
    java
    `jvm-test-suite`
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(libs.testng)
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}

testing {
    suites {
        val test by getting(JvmTestSuite::class) {
            useTestNG(libs.versions.testng)
            targets {
                all {
                    testTask.configure {
                        options {
                            val options = this as TestNGOptions
                            options.threadPoolFactoryClass = "com.example.MyThreadPoolFactory"
                        }
                    }
                }
            }
        }
    }
}


