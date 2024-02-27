package com.neural.androidlearning

import org.junit.Test
import org.junit.Assert.*


// INCOMPLETE

class KMPAlgo {
    companion object {
        private fun patternMap(pattern: String): MutableMap<Int, Int> {
            var patternMap = mutableMapOf<Int, Int>()
            var strPatMap = mutableMapOf<Char, Int>()
            for ((idx, value) in pattern.withIndex()) {
                patternMap[idx] = strPatMap[value] ?: 0
                strPatMap[value] = idx
            }
            return patternMap
        }

        fun kmp(input: String, pattern: String) : List<IntRange> {
            var result = MutableList<IntRange>(0) { 0..0 }
            if (pattern.count() > input.count()) {
                return result
            }
            // index and fallback index
            val patternMap = patternMap(pattern)
            var itrIp = 0
            var itrPt = 0

            while (itrIp < input.count()) {
                if (input[itrIp++] == pattern[itrPt++]) {
                    if (itrPt == pattern.count()) {
                        result.add((itrIp - itrPt) until itrIp)
                        itrPt = 0
                    }
                } else {
                    itrPt = patternMap[itrPt] ?: 0
                }
            }
            return result
        }
    }

    @Test
    fun kmpTest() {
        val pat = "AABA"
        val input = "AABAACAADAABAABA"
//        val pMap = KMPAlgo.patternMap(pat)
//        assertEquals(pat, mutableMapOf<Int, Int>(0 to 0, 1 to 0, 2 to 0, 3 to 1))
        val match = KMPAlgo.kmp(input, pat)
        assertEquals(match.count() , 3)
    }
}