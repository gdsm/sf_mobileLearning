package com.neural.androidlearning.coderByte
import org.junit.Test
import org.junit.Assert.*

class BracketCombination {
//https://coderbyte.com/results/Gagan89:Bracket%20Combinations:Kotlin
    var count = 0
    var memo = hashMapOf<String, Int>()
    private fun combination(open: Int, close: Int) {
        val key = "$open,$close"
        val value = memo[key]
        if ((value != null) && (value > 0)) {
            count += value
            return
        }

        if ((open <= 0) && (close <= 0)) {
            count += 1
            return
        }
        if (open > 0) {
            combination(open - 1, close)
            memo[key] = count
        }
        if ((open != close) && (close > 0)) {
            combination(open, close - 1)
            memo[key] = count
        }
    }

    private fun bracketCombination(num: Int) : Int {
        count = 0
        combination(num, num)
        return count
    }

    @Test fun test() {
//        assertEquals(2, bracketCombination(2))
//        assertEquals(5, bracketCombination(3))
//        assertEquals(5, bracketCombination(4))
    }
}