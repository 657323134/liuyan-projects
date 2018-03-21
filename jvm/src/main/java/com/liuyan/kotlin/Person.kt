package com.liuyan.kotlin

import java.sql.DriverManager.println

/**
@Author: ly
@Description:
@Date: Created in 9:28 2018/3/19
 */
data class Person(val name: String,                   // 1 数据类
                  val age: Int? = null)               // 2 可为空的类型(Int?)；变量声明的默认值

fun main(args: Array<String>) {                       // 3 顶层函数
    val persons = listOf(Person("Alice"),
            Person("Bob", age = 29))     // 4 命名声明

    val oldest = persons.maxBy { it.age ?: 0 }        // 5 lambda表达式；elvis操作符
    println("The oldest is: $oldest")                 // 6 字符模板
}