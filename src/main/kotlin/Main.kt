package com.thomask

import org.koin.core.annotation.ComponentScan
import org.koin.core.annotation.Module
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.koin.core.context.startKoin
import org.koin.ksp.generated.module

fun main() {
    println("Hello World!")
    startKoin {
        modules(AppModule().module)
    }
    MainTest().pingAll()
}

class MainTest : KoinComponent {
    val test1: TestClass1 by inject()
    val test2: TestClass2 by inject()
    val test3: TestClass3 by inject()
    val test4: TestClass4 by inject()
    val test5: TestClass5 by inject()

    fun pingAll() {
        test1.ping1()
        test2.ping2()
        test3.ping3()
        test4.ping4()
        test5.ping5()
    }
}

@Module
@ComponentScan
class AppModule
