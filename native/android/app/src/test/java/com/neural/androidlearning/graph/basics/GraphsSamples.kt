package com.neural.androidlearning.graph.basics

object GraphsSamples {

    fun simpleGraph(): MutableMap<String, Array<String>> {
        val graph = mutableMapOf<String, Array<String>>()
        graph["a"] = arrayOf("b", "c")
        graph["b"] = arrayOf("d")
        graph["c"] = arrayOf("e")
        graph["d"] = arrayOf("f")
        graph["e"] = arrayOf<String>()
        graph["f"] = arrayOf<String>()
        return graph
    }

}