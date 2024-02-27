package com.neural.androidlearning
import org.junit.Test


// COMPLETE
class ArrayTest {

    private fun arrayProperties(arr: Array<Any>) {
        println("Length of array ${arr.size}")
        for ((idx, value) in arr.withIndex()) {
            println("[$idx] = $value")
        }
    }

    @Test fun reverseArray() {
        val arr = arrayOf<Any>(1, 2, 3, 4, 5, 6, 7, 8)
        println("------ Source Array -----")
        arrayProperties(arr)

        var res = mutableListOf<Any>()
        arr.forEach {
            res.add(0, it)
        }
        println("------ Result Array -----")
        arrayProperties(res.toTypedArray())
    }
}