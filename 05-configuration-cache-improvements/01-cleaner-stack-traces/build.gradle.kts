tasks.register("printProjectName") {
    doLast {
        println("Project name: ${project.name}")
    }
}