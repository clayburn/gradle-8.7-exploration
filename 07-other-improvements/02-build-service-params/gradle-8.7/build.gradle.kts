class MyBuildService : BuildService<MyBuildService.Parameters> {
    interface Parameters : BuildServiceParameters {
    }

    override fun getParameters(): Parameters {
        return object : Parameters {}
    }
}

var serviceProvider: Provider<MyBuildService> = project.gradle.sharedServices.registerIfAbsent("myBuildService", MyBuildService::class.java)

tasks.register("buildServiceParams") {
    usesService(serviceProvider)
}
