interface ListExtension {
    val list: ListProperty<String>
}

val extension = extensions.create<ListExtension>("listExtension")
extension.list.convention(listOf("one"))

fun listContentsToString() = "[${extension.list.get().joinToString(separator = ", ")}]"

val printListContentsBefore by tasks.registering {
    doLast {
        println("List contents before modification: ${listContentsToString()}")
    }
}

val printListContentsAfter by tasks.registering {
    doLast {
        println("List contents after modification: ${listContentsToString()}")
    }
}


val addItemToList by tasks.registering {
    doLast {
        println("Adding \"two\" to list")
        extension.list.add("two")
    }
    dependsOn(printListContentsBefore)
    finalizedBy(printListContentsAfter)
}

val appendItemToList by tasks.registering {
    doLast {
        println("Appending \"two\" to list")
        extension.list.append("two")
    }
    dependsOn(printListContentsBefore)
    finalizedBy(printListContentsAfter)
}

val addEmptyValueToList by tasks.registering {
    doLast {
        println("Adding empty value to list")
        extension.list.add(providers.environmentVariable("MY_ENV_VAR_THAT_DEFINITELY_DOES_NOT_EXIST"))
    }
    dependsOn(printListContentsBefore)
    finalizedBy(printListContentsAfter)
}

val appendEmptyValueToList by tasks.registering {
    doLast {
        println("Appending empty value to list")
        extension.list.append(providers.environmentVariable("MY_ENV_VAR_THAT_DEFINITELY_DOES_NOT_EXIST"))
    }
    dependsOn(printListContentsBefore)
    finalizedBy(printListContentsAfter)
}


