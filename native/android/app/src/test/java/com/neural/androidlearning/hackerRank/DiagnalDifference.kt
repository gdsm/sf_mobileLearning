package com.neural.androidlearning.hackerRank

import junit.framework.Assert.assertEquals
import org.junit.Test
import kotlin.math.abs

class DiagnalDifference {

    @Test
    fun diagnolDifference() {
        //https://www.hackerrank.com/challenges/diagonal-difference/problem?isFullScreen=true

        val sample1 = listOf(listOf(1,2,3), listOf(4, 5,6), listOf(9,8,9))
        val sample2 = listOf(listOf(3))

        fun getDifference(arr: List<List<Int>>): Int {
            if (arr.isEmpty()) {
                // Empty matrix
                return 0
            }
            if (arr.count() != arr.first().count()) {
                // its not a square matrix
                return 0
            }
            if (arr.count() == 1) {
                // its 1X1 matrix, sum will be 0
                return 0
            }
            var d1i = 0
            var d1j = 0
            var d2i = arr.count() - 1
            var d2j = 0
            var s1 = 0
            var s2 = 0

            while (d1i < arr.count()) {
                s1 += arr[d1i][d1j]
                s2 += arr[d2i][d2j]

                d1i += 1
                d1j += 1
                d2i -= 1
                d2j += 1
            }
            return if (s1-s2 < 0) {
                (s1 - s2) * -1
            } else {
                abs(s1 - s2)
            }
        }
        assertEquals(getDifference(listOf<List<Int>>()), 0)
        assertEquals(getDifference(sample2), 0)
        assertEquals(getDifference(sample1), 2)
    }
}