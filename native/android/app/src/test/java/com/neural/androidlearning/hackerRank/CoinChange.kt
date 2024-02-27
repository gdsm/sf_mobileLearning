package com.neural.androidlearning.hackerRank

import org.junit.Test
import org.junit.Assert.*

class CoinChange {
//    https://www.hackerrank.com/challenges/coin-change/problem?isFullScreen=true

    fun compute(n: Int, c: Array<Long>): MutableList<MutableList<Long>>? {
        if (n == 0) { return mutableListOf<MutableList<Long>>(mutableListOf<Long>()) }
        else if (n < 0) { return null }

        var result: MutableList<MutableList<Long>> = mutableListOf<MutableList<Long>>()
        for (i in c) {
            val remainder = compute(n - i.toInt(), c)
            remainder?.forEach {
                it.add(i)
                result.add(it)
            }
        }
        return result
    }

    fun getWays(n: Int, c: Array<Long>): Long {
        // Write your code here
        if ((n < 0) || (n > 250) || (c.count() < 0) || (c.count() > 50)) {
            return 0
        }
        val c = compute(n, c)
        return c?.count()?.toLong() ?: 0
    }
    @Test
    fun test() {
//        assertEquals(3, getWays(3, arrayOf<Long>(1, 2)))
//        assertEquals(2, getWays(2, arrayOf<Long>(1, 2)))
        assertEquals(4, getWays(4, arrayOf<Long>(1, 2, 3)))
    }
}