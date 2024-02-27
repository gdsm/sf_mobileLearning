package com.neural.androidlearning.graph.basics

import org.junit.Test

class BFS {

    @Test
    fun testBfs() {
        val graph = GraphsSamples.simpleGraph()
        fun traverse(queue: MutableList<String>): MutableList<String> {
            val visited: MutableList<String> = mutableListOf()
            while (queue.isNotEmpty()) {
                val current = queue.removeAt(0)
                if (!visited.contains(current)) {
                    visited.add(current)
                }
                val neighbours = graph[current]
                if (neighbours != null) {
                    for (neighbour in neighbours) {
                        if (!visited.contains(neighbour)) {
                            queue.add(neighbour)
                        }
                    }
                }
            }
            return visited
        }
        println(traverse(mutableListOf("a")))
    }
}