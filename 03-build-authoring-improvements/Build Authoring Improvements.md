# Build Authoring Improvements

## Better API for updating collection properties

This release improves the API for lazy collection properties, a key element of Gradle lazy configuration. Before this release, the interaction of classical collection methods, the concept of convention, and the rules around empty providers have resulted in surprising behaviors for users in some scenarios. Based on the community feedback, this release of Gradle introduces alternative APIs for updating collections with a clearer contract:

- HasMultipleValues.append*(...) which are meant as more convenient replacements for HasMultipleValues.add*(...).
- MapProperty.insert*(...) which are meant as more convenient replacements for MapProperty.put*(...).
The new APIs provide the following benefits:

### Conventions are honored
One common complaint was that adding values (using `ListProperty.add(...)`, `SetProperty.add(...)` or `MapProperty.put(...)` on top of values from a convention would result in losing the values from the convention.

For example, in an applied plugin, a list property `ListProperty<String>` is configured with a convention:

```groovy
listProp.convention(listOf("one"))
```

In the build file, the build author adds elements to that list property:

```groovy
listProp.add("two")
// listProp now only contains "two", that’s confusing
```

However, as explained in the snippet, the behavior is surprising. The newly introduced methods (such as `ListProperty.append(...)`, `SetProperty.append(...)` and `MapProperty.insert(...)`) allow the user to express that the convention should be preserved:

```groovy
listProp.append("two")
// listProp now contains ["one", "two"], as expected
```

#### Example

```shell
./01-conventions-are-honored/run.sh
```

### Empty provider values are ignored
Another common source of confusion is how empty providers are handled in collection properties. For instance, adding an empty provider to a collection property using add(...) will cause the entire property to become void of any values as well.

```groovy
listProp.add("one")
listProp.add(providers.environmentVariable("myEnvVar"))
// listProp will be empty if `myEnvVar` is not defined
```

In order to avoid that behavior, you can instead use the new update APIs introduced in this release (such as `ListProperty.append(...)`, `SetProperty.append(...)` and `MapProperty.insert(...)`):

```groovy
listProp.append("one")
listProp.append(providers.environmentVariable("myEnvVar"))
// listProp will still contain "one" if myEnvVar is not defined
```

#### Example

```shell
./02-empty-values-are-ignored/run.sh
```
