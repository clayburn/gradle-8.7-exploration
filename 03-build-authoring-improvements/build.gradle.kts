interface ListExtension {
    val list: ListProperty<String>
}

val extension = extensions.create<ListExtension>("listExtension")
extension.list.convention(listOf("one"))

val addItemToList by tasks.registering {
    doLast {
        println("Adding \"two\" to list")
        extension.list.add("two")
    }
}

val appendItemToList by tasks.registering {
    doLast {
        println("Appending \"two\" to list")
        extension.list.append("two")
    }
}

val addEmptyValueToList by tasks.registering {
    doLast {
        println("Adding empty value to list")
        extension.list.add(providers.environmentVariable("MY_ENV_VAR_THAT_DEFINITELY_DOES_NOT_EXIST"))
    }
}

val appendEmptyValueToList by tasks.registering {
    doLast {
        println("Appending empty value to list")
        extension.list.append(providers.environmentVariable("MY_ENV_VAR_THAT_DEFINITELY_DOES_NOT_EXIST"))
    }
}

tasks.register("printList") {
    doLast {
        extension.list.get().forEach { item -> println(item) }
    }
    mustRunAfter(addItemToList, appendItemToList, addEmptyValueToList, appendEmptyValueToList)
}


