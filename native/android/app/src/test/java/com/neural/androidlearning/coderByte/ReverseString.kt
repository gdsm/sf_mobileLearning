package com.neural.androidlearning.coderByte
import org.junit.Test
import org.junit.Assert.*

class ReverseString {

    fun FirstReverse(str: String): String {
        // code goes here
        val count = str.count() - 1
        if (count <= 0) { return str }
        var rStr = String()
        for (i in 0..count) {
            rStr += str[count - i]
        }
        return rStr;
    }

    @Test fun testReverseString () {
        assertEquals(FirstReverse("ABC"), "CBA")
    }
}