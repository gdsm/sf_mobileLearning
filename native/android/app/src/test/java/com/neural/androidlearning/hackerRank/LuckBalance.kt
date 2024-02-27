package com.neural.androidlearning.hackerRank
import org.junit.Test
import org.junit.Assert.*

class LuckBalance {
    /*
    * https://www.hackerrank.com/challenges/luck-balance/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
    * */

    fun luckBalance(k: Int, contests: Array<Array<Int>>): Int {
        if ((contests.count() < 1) or (contests.count() > 100)) {
            return 0
        }
        var allowedToLoose = mutableListOf<Pair<Int , Int>>()
        var luck = 0

        fun validateForLoose(l: Int, t: Int) : Boolean {
            if (t == 0) {
                return false
            }
            if (allowedToLoose.count() < k) {
                return true
            }
            if (l > allowedToLoose.first().first) {
                return true
            }
            return false
        }

        for (p in contests) {
            
        }

        return luck
    }

    @Test fun testLuckBalance() {
        var k = 2
        var context = mutableListOf<Array<Int>>()
        for (i in 0..2) {
            when (i) {
                0 -> context.add(i, arrayOf<Int>(5, 1))
                1 -> context.add(i, arrayOf<Int>(1, 1))
                2 -> context.add(i, arrayOf<Int>(4, 0))
            }
        }
        assertEquals(2, luckBalance(k, contests = context.toTypedArray()))
    }
}