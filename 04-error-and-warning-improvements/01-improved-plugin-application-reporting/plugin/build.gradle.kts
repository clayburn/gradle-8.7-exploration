import org.gradle.api.attributes.plugin.GradlePluginApiVersion.GRADLE_PLUGIN_API_VERSION_ATTRIBUTE

plugins {
    id("java-gradle-plugin")
    id("com.gradle.plugin-publish") version "1.2.1"
}

group = "com.example"
version = "0.1.0"

repositories {
    gradlePluginPortal()
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}



configurations.configureEach {
    if (isCanBeConsumed) {
        attributes {
            attribute(GRADLE_PLUGIN_API_VERSION_ATTRIBUTE, objects.named<GradlePluginApiVersion>(GradleVersion.version("42.0").version))
        }
    }
}

gradlePlugin {
    plugins {
        register("myCustomPlugin") {
            id = "com.example.my-custom-plugin"
            implementationClass = "com.example.MyCustomPlugin"
        }
    }
}
