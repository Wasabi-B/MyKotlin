package com.easy.kotlin

import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class VariableVSValueTest {
    val variableVSValue = VariableVSValue()

    @Test
    fun testDeclareVar(){

//        variableVSValue.declareVar()
//        variableVSValue.typeInference()
        variableVSValue.int2Long()
    }

    @Test
    fun testDeclareVal(){
        variableVSValue.declareVal()
    }

    @Test
    fun testGetLength(){
        val obj = "abcedf"
        val len = variableVSValue.getLength(obj)
        Assert.assertTrue(len == 6)

        val obj2 : Any = Any()
        variableVSValue.getLength(obj2)

    }
}