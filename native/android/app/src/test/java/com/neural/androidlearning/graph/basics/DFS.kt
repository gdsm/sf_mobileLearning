package com.neural.androidlearning.graph.basics

import org.junit.Test

class DFS {

    @Test
    fun testDfs() {
        val graph = GraphsSamples.simpleGraph()
        fun traverse(stack: MutableList<String>): MutableList<String> {
            val visited: MutableList<String> = mutableListOf()
            while (stack.isNotEmpty()) {
                val current = stack.removeAt(0)
                if (!visited.contains(current)) {
                    visited.add(current)
                }
                val neighbours = graph[current]
                if (neighbours != null) {
                    for (neighbour in neighbours) {
                        if (!visited.contains(neighbour)) {
                            stack.add(0, neighbour)
                        }
                    }
                }
            }
            return visited
        }
        println(traverse(mutableListOf("a")))
    }
}