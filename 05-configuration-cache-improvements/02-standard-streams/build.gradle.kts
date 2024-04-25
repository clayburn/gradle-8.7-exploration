tasks.register<Exec>("helloWorld") {
    commandLine("echo", "Hello, world!")
    standardOutput = System.err
}