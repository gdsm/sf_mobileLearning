package com.neural.androidlearning.geekForGeeks


import org.junit.Test
import org.junit.Assert.*
import kotlin.math.pow

infix fun Int.`**`(exponent: Int): Int = toDouble().pow(exponent).toInt()

class RecursionProblems {

    @Test
    fun test1() {
        // https://www.geeksforgeeks.org/given-a-string-print-all-possible-palindromic-partition/
        var memo: MutableMap<String, Boolean> = mutableMapOf<String , Boolean>()
        fun recursive(input: String): Boolean {
            if (input.count() == 1) {
                return true
            }
            val fd = input.drop(1)
            if (recursive(fd)) {
                memo[fd] = true
            }
            val ld = input.dropLast(1)
            if (recursive(ld)) {
                memo[ld] = true
            }

            val mid = input.count() / 2
            for (i in 0 until mid) {
                if (input[i] != input[input.count() - 1 - i]) {
                    memo[input] = false
                    return false
                }
            }
            memo[input] = true
            return true
        }

//        recursive("aab")
//        assertEquals(3, memo.count { it.value })
//        memo.clear()

        recursive("nitin")
        assertEquals(5, memo.count { it.value })
        memo.clear()
    }

    @Test
    fun reverseNumber() {
        assertEquals(reverseNumber(1234), 4321)
        assertEquals(reverseNumber(110), 11)
    }

    @Test
    fun recurssionAtoI() {
        assertEquals(atoi("12"), 12)
        assertEquals(atoi("1234"), 1234)
        assertEquals(atoi("0000"), 0)
        assertEquals(atoi("abc"), 0)
    }
}

fun RecursionProblems.reverseNumber(n: Int) : Int {
    var div: Int = n
    var retValue = 0
    val reverse = mutableListOf<Int>()
    var multiplier: Int = 1
    while (div > 0) {
        reverse.add(0, (div % 10))
        div /= 10
    }
    for (i in 0 until reverse.count()) {
        retValue += (reverse[i] * multiplier)
        multiplier *= 10
    }
    return retValue
}

fun RecursionProblems.atoi(str: String): Int {
    val table = mutableMapOf<Char, Int>('1' to 1, '2' to 2, '3' to 3, '4' to 4, '5' to 5, '6' to 6,
        '7' to 7, '8' to 8, '9' to 9, '0' to 0)
    val count = str.count()
    if (count <= 0) {
        return 0
    }
    var v = table[str.first()] ?: return 0
    val result = atoi(str.drop(1))
    v *= (10 `**` count - 1)
    return v + result
}

fun RecursionProblems.binaryHalf(n: Int): String {
    // https://www.geeksforgeeks.org/find-all-even-length-binary-sequences-with-same-sum-of-first-and-second-half-bits/

return ""

}