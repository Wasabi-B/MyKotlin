package com.easy.kotlin

import java.util.*


/**
 * 声明变量和值
 * */

class VariableVSValue {

    /**
     * 声明变量
     * */
    fun declareVar() {
        var a = 1
        a = 2
        println(a)
        println(a::class)
        println(a::class.java)

        var x = 5       //自动推断出‘Int’类型
        x += 1

        println("x = $x")
    }

    /**
     * 声明值
     * */
    fun declareVal() {
        val b = "a"
        //b = "b"          //编译器会报错 ：val cannot be reassigned
        println(b)
        println(b::class)
        println(b::class.java)

        val c: Int = 1 //立即赋值
        val d = 2       //自动推断出‘Int’类型
        val e: Int     //如果没有初始值，类型不能省略
        e = 3           //明确赋值
        println("c = $c,d=$d,e=$e")
    }

    /**
     * 类型推断
     * */
    fun typeInference(){
        val str = "abc"
        println(str)
        println(str is String)
        println(str::class)
        println(str::class.java)

        val d = Date()
        println(d)
        println(d is Date)
        println(d::class)
        println(d::class.java)

        val bool = true
        println(bool)
        println(bool::class)
        println(bool::class.java)

        var array = arrayOf(1,2,3)
        println(array)
        println(array is Array)
        println(array::class)
        println(array::class.java)

    }


    /**
     * 显示调用类型装换函数
     * Int ->  Long
     * */
    fun int2Long(){
        val x : Int = 10
        val y : Long = x.toLong()

        val m = 10
        //val n : Long = m   //Type mismatch
        val n : Double = m.toDouble()

        println("x = $x , y = $y")
        println("m = $m , n = $n")
    }

    /**
     * 使用is运算符进行类型检测
     * */
    fun getLength(obj : Any) :Int?{
        var result = 0
        if (obj is String){
            //‘obj’在该条件分之内自动转换成‘String’
            println(obj::class)
            result = obj.length
            println(result)
        }

        //在离开类型检测分支后，‘obj’任然是‘Any’类型
        println("--------")
        println(obj::class)
        return result
    }

    /**
     * 字符串与其模板表达式
     * */


}