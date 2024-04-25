package com.example;

import org.testng.IDynamicGraph;
import org.testng.ISuite;
import org.testng.ITestNGMethod;
import org.testng.thread.IExecutorFactory;
import org.testng.thread.ITestNGThreadPoolExecutor;
import org.testng.thread.IThreadWorkerFactory;

import java.util.Comparator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;

@SuppressWarnings({"unused", "deprecation"})
public class MyThreadPoolFactory implements IExecutorFactory {

    MyThreadPoolFactory() {
        throw new RuntimeException("Not implemented");
    }

    @Override
    public ITestNGThreadPoolExecutor newSuiteExecutor(
            String name,
            IDynamicGraph<ISuite> graph,
            IThreadWorkerFactory<ISuite> factory,
            int corePoolSize,
            int maximumPoolSize,
            long keepAliveTime,
            TimeUnit unit,
            BlockingQueue<Runnable> workQueue,
            Comparator<ISuite> comparator) {
        throw new RuntimeException("Not implemented");
    }

    @Override
    public ITestNGThreadPoolExecutor newTestMethodExecutor(String name,
                                                           IDynamicGraph<ITestNGMethod> graph,
                                                           IThreadWorkerFactory<ITestNGMethod> factory,
                                                           int corePoolSize,
                                                           int maximumPoolSize,
                                                           long keepAliveTime,
                                                           TimeUnit unit,
                                                           BlockingQueue<Runnable> workQueue,
                                                           Comparator<ITestNGMethod> comparator) {
        throw new RuntimeException("Not implemented");
    }
}
