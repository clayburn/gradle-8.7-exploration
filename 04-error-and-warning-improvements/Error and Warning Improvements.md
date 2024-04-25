# Error and Warning Improvements

Gradle provides a rich set of error and warning messages to help you understand and resolve problems in your build.

## Improved plugin application error reporting

When applying a plugin that requires a higher version of Gradle (by specifying the `org.gradle.plugin.api-version` attribute), the error message when dependency resolution fails will now clearly state the issue:

```
FAILURE: Build failed with an exception.

* What went wrong:
  A problem occurred configuring root project 'example'.
> Could not resolve all files for configuration ':classpath'.
> Could not resolve com.example:plugin:1.0.
Required by:
project : > com.example.greeting:com.example.greeting.gradle.plugin:1.0
> Plugin com.example:plugin:1.0 requires at least Gradle 8.0. This build uses Gradle 7.6.

* Try:
> Upgrade to at least Gradle 8.0. See the instructions at https://docs.gradle.org/8.7/userguide/upgrading_version_8.html#sub:updating-gradle.
> Downgrade plugin com.example:plugin:1.0 to an older version compatible with Gradle 7.6.
```

### Example

```shell
./01-improved-plugin-application-reporting/run.sh
```

The failure’s suggested resolutions will include upgrading your version of Gradle or downgrading the version of the plugin. This replaces the previous low-level incompatibility message containing details about all the attributes involved in the plugin request.

## Improved copy task error reporting

When including a compressed archive in a Copy task results in duplicate files and DuplicatesStrategy.Fail is used, the error message will now clearly state the issue:

```
Cannot copy file <SOURCE_FILE> to <DESTINATION_DIR> because file <OTHER_SOURCE_FILE> has already been copied there.
```
### Example

```shell
./02-improved-copy-error-reporting/run.sh
```

## Suppressable 'dependencies-without-versions' validation error
When generating Gradle Module Metadata files, Gradle prevents your project from publishing broken metadata by looking for common configuration errors.

One of those errors is publishing metadata with dependencies that do not have versions. This validation error can now be suppressed as there are use cases where such metadata is valid:

```groovy
tasks.withType(GenerateModuleMetadata).configureEach {
    suppressedValidationErrors.add('dependencies-without-versions')
}
```

### Example

```shell
./03-suppressable-dependencies-without-version-error/run.sh
```
