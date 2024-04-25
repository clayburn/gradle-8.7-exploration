val randomFile = project.layout.buildDirectory.file ("random-symlink.txt")

tasks.register("printRandomValue") {
    inputs.files(randomFile).withPropertyName("randomFile")
    doLast {
        // print value of build/random.txt
        println(randomFile.get().asFile.readText())
    }
}