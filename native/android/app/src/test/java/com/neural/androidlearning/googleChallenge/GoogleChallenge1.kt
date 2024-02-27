package com.neural.androidlearning.googleChallenge

import org.junit.Test
import org.junit.Assert.*


class GoogleChallenge1 {

    // Complexity : O(1)
    fun stringify(r: Int, c: Int) : String {
        return "[Row:$r][Col:$c]"
    }

    @Test
    fun challenge() {
        // https://www.youtube.com/watch?v=4tYoVx0QoN0

        // Complexity : O(1)
        fun isBoundaryCoordinate(row: Int, col: Int, input: List<List<Int>>) : Boolean {
            return (row == 0) ||
                    (col == 0) ||
                    (row == input.count() - 1) ||
                    (col == input.first().count() - 1)
        }

        // Complexity : O(1)
        fun isValidCoordinate(row: Int, col: Int , input: List<List<Int>>) : Boolean {
            return (row >= 0) &&
                    (col >= 0) &&
                    (col < input.count()) &&
                    (row < input.first().count())
        }

        // Complexity : O(4^RXC)
        fun isConnectedToBoundary(row: Int, col: Int, input: List<List<Int>>) : Boolean {
            // this will run BFS
            val queue = mutableListOf<Pair<Int, Int>>()
            queue.add(Pair(row, col))
            val visited = mutableMapOf<String, Boolean>()

            while (queue.isNotEmpty()) {
                val v = queue.removeFirst()
                if (visited[stringify(v.first, v.second)] == true) {
                    continue
                }
                visited[stringify(v.first, v.second)] = true
                if (isBoundaryCoordinate(v.first, v.second, input)) {
                    return true
                }
                if (isValidCoordinate(v.first-1, v.second, input) &&
                    input[v.first-1][v.second] == 1) {
                    queue.add(Pair(v.first - 1, v.second))
                }
                if (isValidCoordinate(v.first, v.second-1, input) &&
                    input[v.first][v.second-1] == 1) {
                    queue.add(Pair(v.first, v.second-1))
                }
                if (isValidCoordinate(v.first+1, v.second, input) &&
                    input[v.first+1][v.second] == 1) {
                    queue.add(Pair(v.first+1, v.second))
                }
                if (isValidCoordinate(v.first, v.second+1, input) &&
                    input[v.first][v.second+1] == 1) {
                    queue.add(Pair(v.first, v.second+1))
                }
            }
            return false
        }

        // Complexity : O(RXC)
        fun test(input: MutableList<MutableList<Int>>): MutableList<MutableList<Int>> {
            if (input.isEmpty()) {
                return input
            }
            val row = input.first().count()
            val col = input.count()

            for (r in 1 until (row - 1)) {
                for (c in 1 until (col - 1)) {
                    // scope of optimisation here.
                    // If we can memorize while traversing BFS which ones are connected to boundary
                    // we can drop isConnectedToBoundary
                    if ((input[r][c] == 1) && (isConnectedToBoundary(r, c, input))) {
                        input[r][c] = 1
                    } else {
                        input[r][c] = 0
                    }
                }
            }
            return input
        }

        // Brute Force Complexity : O(RC * 4^RC) = O(4^RC)
        val data = sampleInput1()
        assertEquals(data.second, test(data.first))
    }

    private fun sampleInput1 (): Pair< MutableList<MutableList<Int>> , MutableList<MutableList<Int>> >{
        val input = mutableListOf<MutableList<Int>>()
        input.add(mutableListOf<Int>(1,0,0,0,0,0))
        input.add(mutableListOf<Int>(0,1,0,1,1,1))
        input.add(mutableListOf<Int>(0,0,1,0,1,0))
        input.add(mutableListOf<Int>(1,1,0,0,1,0))
        input.add(mutableListOf<Int>(1,0,1,1,0,0))
        input.add(mutableListOf<Int>(1,0,0,0,0,1))

        val output = mutableListOf<MutableList<Int>>()
        output.add(mutableListOf<Int>(1,0,0,0,0,0))
        output.add(mutableListOf<Int>(0,0,0,1,1,1))
        output.add(mutableListOf<Int>(0,0,0,0,1,0))
        output.add(mutableListOf<Int>(1,1,0,0,1,0))
        output.add(mutableListOf<Int>(1,0,0,0,0,0))
        output.add(mutableListOf<Int>(1,0,0,0,0,1))
        return Pair(input, output)
    }
}