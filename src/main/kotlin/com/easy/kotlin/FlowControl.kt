package com.easy.kotlin

import java.lang.Integer.parseInt

fun main(args:Array<String>){
    println(max1(1,2))
    cases(2)
    switch(3)
    switch2(123)
    switch3()
}
/*--------------------     if...else...      --------------------------------------------*/
/**
 * if...eles...
 * */
fun max(a:Int,b:Int) :Int{
    //作为表达式
    val max = if (a>b)a else b
    return max  //return if(a>b) a else b
}

fun max1(a:Int,b:Int):Int{
    //传统用法
    var max1 = a
    if (a<b) max1 =b
    return max1
}

fun max2(a:Int,b: Int):Int{
    //with else
    var max2 : Int
    if (a>b){
        max2 = a
    }else{
        max2 = b
    }
    return max2
}

fun max3(a:Int ,b:Int) :Int{
    val max = if(a>b){
        print("Max is a")
        a
    }else{
        print("Max is b")
        b
    }
    return max
}


/*---------------------------------------  when   ---------------------------------------------*/
/**
 * 类似switch
 * 如果其他分支都不满足条件会到else分支（类似default）
 * */
fun cases(obj:Any){
    when (obj){
        1 -> print("第一项")
        "hello"-> print("这个是字符串hello")
        is Long-> print("这是一个Long类型数据")
        !is String -> print("这不是String类型的数据")
        else -> print("else类似于Java中的default")
    }
}
/**
 * 如果我们有很多分支需要用相同方式处理，则可以把多个分支条件放在一起，用逗号隔开
 * */
fun switch(x:Any){
    when(x){
        -1,0 -> println("x == -1 or x ==0")
        1 -> println("x==1")
        2 -> println("x==2")
        else ->{
            //注意这个块
            println("x is neither 1 nor 2")
        }

    }
}

fun switch2(x:Int){
    val s = "123"
    when(x){
        -1,0 -> println("x == -1 or x ==0")
        1 -> println("x==1")
        2 -> println("x==2")
        8 -> println("x is 8")
        parseInt(s) -> println("x is 123")
        else ->{
            println("x is neither 1 nor 2")
        }
    }
}

/**
 * 可以检测一个值在（in）或者不在（!in）一个区间或集合中
 * */
fun switch3(){
    val x = 1
    val validNumbers = arrayOf(1,2,3)
    when(x){
        in 1..10 -> println("x is in the range")
        in validNumbers -> println("x is valid")
        !in 10..20 -> println("x is outside the range")
        else -> println("none of the above")
    }
}

/*---------------------------------- for循环 --123----------------------------------------------------*/



























