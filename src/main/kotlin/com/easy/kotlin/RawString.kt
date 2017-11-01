package com.easy.kotlin

/**
 * 字符串与其模板表达式
 * */
fun main(args:Array<String>){
    //原始字符串
    val rawString = """
        fun helloWorld(val name : String){
            println("Hello,world!")
        }
        """

    println(rawString)

    //字符串可以包含模板表达式
    val fooTemplateString = "$rawString has ${rawString.length} characters"
    println(fooTemplateString)

}