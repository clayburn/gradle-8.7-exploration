# Support for building projects with Java 22

Gradle now supports using Java 22 for compiling, testing, and starting other Java programs. Selecting a language version is done using toolchains.

You cannot run Gradle 8.7 itself with Java 22 because Groovy still needs to support JDK 22. However, future versions are expected to provide this support.

## Example

```shell
./run.sh
```
## Pull Request

https://github.com/gradle/gradle/pull/27988/files