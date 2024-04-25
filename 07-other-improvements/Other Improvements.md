# Other Improvements

## Generating concise projects with Gradle init
Using the new --no-comments option allows Gradle init to generate new projects that contain code without comments. The resulting build files and source files are smaller and less verbose.

```gradle init --use-defaults --type kotlin-library --no-comments```

You can permanently set this preference by configuring the `org.gradle.buildinit.comments` property to false in Gradle properties.

### Example

```shell
./01-gradle-init/run.sh
```

## Shared build service registration without parameters
Gradle enables tasks to share state or resources, such as pre-computed values or external services, through build services, which are objects holding the state for task use. A build service can optionally take parameters, which Gradle injects into the service instance when creating it.

Shared build services that do not require additional configuration can now be registered without having to provide an empty configuration action using the updated registerIfAbsent() method:

```
gradle.sharedServices.registerIfAbsent("counter", CountingService, voidAction) 	// Old method
gradle.sharedServices.registerIfAbsent("counter", CountingService)		// New method
```

### Example

```shell
./02-build-service-params/run.sh
```

## Support for TestNG's threadPoolFactoryClass parameter

TestNG is a testing framework supported in Gradle. In TestNG, the threadPoolFactoryClass attribute is used to specify a custom thread pool factory class, which details how TestNG manages threads for parallel test execution.

The threadPoolFactoryClass parameter can now be configured on TestNGOptions for TestNG versions that support it (i.e., TestNG 7.0.0 and above):

```groovy
testing {
    suites {
        test {
            useTestNG("7.5")
            targets {
                all {
                    testTask.configure {
                        options.threadPoolFactoryClass = "com.example.MyThreadPoolFactory"
                    }
                }
            }
        }
    }     
}
```
An error will occur if this parameter is set for a version of TestNG that does not support it.

Only works on TestNG < 7.10.0: https://github.com/gradle/gradle/issues/28955

### Example

```shell
./03-testng-threadPoolFactoryClass/run.sh
```

## Consistent sorting of ignored keys in the metadata verification file
To mitigate the security risks and avoid integrating compromised dependencies in your project, Gradle supports dependency verification. Dependency verification is typically done using checksums or digital signatures. Gradle verifies that downloaded artifacts match the expected checksums or are signed with trusted keys.

Before this release, the ignored keys list in the metadata verification file was not properly sorted by Gradle so that the order would change depending on the execution order, impacting the reproducibility of the build and checksums for the file. In this release, the order is guaranteed to be preserved regardless of the execution order.

### Example

```shell
./04-consistent-key-sorting/run.sh
```

## Better support for symlinks with File System Watching

Gradle maintains a Virtual File System (VFS) to calculate what needs to be rebuilt on repeat builds of a project. By watching the file system, Gradle keeps the VFS current between builds, reducing the required I/O operations.

This version fixes a problem with detecting content changes indirectly referenced via symlinks, improving the build's correctness.

### Example

```shell
./05-vfs-symlink-support/run.sh
```

## Support for constraints in JVM test suite dependencies block

The strongly-typed dependencies block introduced in Gradle 7.6 did not support dependency constraints.

In this release, dependency constraints can now be added:

```groovy
testing {
    suites {
        getByName<JvmTestSuite>("test") {
            dependencies {
                implementation(constraint("foo:bar:1.0"))
            }
        }
    }
}
```

Providing separate strings or using named arguments for each part is not supported currently.

### Example

```shell
./06-jvm-test-suite-constraints/run.sh
```
