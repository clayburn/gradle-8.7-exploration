# Configuration Caching Improvements

The configuration cache improves build time by caching the result of the configuration phase and reusing it for subsequent builds. This feature can significantly improve build performance.

## Cleaner stack traces in the configuration cache report

The stack traces shown in the configuration cache report for forbidden API calls can be long and contain internal Gradle frames that do not always help to troubleshoot the issue. With this release, internal stack frames are collapsed by default to highlight the build logic that triggered the error:

Collapsed stack frames in the configuration cache report

The collapsed frames can still be expanded and examined if necessary.

### Example

```shell
./01-cleaner-stack-traces/run.sh
```

## Supporting standard streams as task property values

The standard streams (`System.in`, `System.out`, and `System.err`) can now be used as `standardInput`, `standardOutput`, and `errorOutput` of `Exec` and `JavaExec` tasks without breaking configuration caching.

User created tasks with properties of types `java.io.InputStream` and `java.io.OutputStream` can also use the standard streams as property values. Setting up custom standard streams with `System.setIn`, `System.setOut`, and `System.setErr` isn't supported.

### Example

```shell
./02-standard-streams/run.sh
```
