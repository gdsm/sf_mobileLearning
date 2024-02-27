package com.neural.androidlearning.HackerRank
import org.junit.Test
import org.junit.Assert.*


// COMPLETE

class HackerRank {
    @Test
    fun panGramTest() {
        fun test(s: String) : String {
            val map = mutableMapOf<Char, Boolean>('a' to false, 'b' to false, 'c' to false, 'd' to false, 'e' to false, 'f' to false, 'g' to false, 'h' to false, 'i' to false, 'j' to false, 'k' to false, 'l' to false, 'm' to false, 'n' to false, 'o' to false, 'p' to false, 'q' to false, 'r' to false, 's' to false, 't' to false, 'u' to false, 'v' to false, 'w' to false, 'x' to false, 'y' to false, 'z' to false)
            val upperToLowerMap = mutableMapOf<Char, Char>('A' to 'a', 'B' to 'b', 'C' to 'c', 'D' to 'd', 'E' to 'e', 'F' to 'f', 'G' to 'g', 'H' to 'h', 'I' to 'i', 'J' to 'j', 'K' to 'k', 'L' to 'l', 'M' to 'm', 'N' to 'n', 'O' to 'o', 'P' to 'p', 'Q' to 'q', 'R' to 'r', 'S' to 's', 'T' to 't', 'U' to 'u', 'V' to 'v', 'W' to 'w', 'X' to 'x', 'Y' to 'y', 'Z' to 'z')
            s.forEach {
                val l = upperToLowerMap[it]
                map[l ?: it] = true
            }
            var res = "pangram"
            map.forEach {
                if (!it.value) {
                    res = "not pangram"
                }
            }
            return res
        }
        assertEquals(test("We promptly judged antique ivory buckles for the next prize"), "pangram")
        assertEquals(test("We promptly judged antique ivory buckles for the prize"), "not pangram")
    }

    @Test
    fun minimumAbsoluteDifference() {
        fun test(input: Array<Int>): Int {

            return -1
        }
        assertEquals(test(arrayOf(3, -7, 0)), 3)
    }
}