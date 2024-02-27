package com.neural.androidlearning

import org.junit.Test

class MedianMeanMode {

    private fun getDataSet(complexity: UInt) : List<Int> {
        if (complexity > 5u) {
            return listOf()
        }

        val dataset: List<List<Int>> = mutableListOf()

        return dataset[complexity.toInt()]
    }

    @Test
    fun testMean() {

    }
}