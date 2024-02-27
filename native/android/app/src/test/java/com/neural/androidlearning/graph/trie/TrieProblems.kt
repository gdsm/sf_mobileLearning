package com.neural.androidlearning.graph.trie

import org.junit.Test

class TrieProblems {

    class TrieNode(val complete: Boolean) {
        val childs = mutableMapOf<Char, TrieNode>()
        fun add(word: String) {
            if (word.isEmpty()) { return }
            val first = word.first()
            val n = childs[first] ?: TrieNode(word.count() == 1)
            n.add(word.drop(1))
            childs[first] = n
        }

        fun search(word: String): Boolean {
            if (word.isEmpty()) { return true }
            val node = childs[word.first()] ?: return false
            if (word.count() == 1) { return node.complete }
            return node.search(word.drop(1))
        }
    }

    @Test
    fun buildBasicTrie() {
        val rootNode = buildAlphabetTrie(mutableListOf<String>("i", "like", "sam", "sung", "samsung", "mobile", "ice",
            "cream", "icecream", "man", "go", "mango"))
        println("Does exist ${rootNode.search("ice")}")
        println("Does exist ${rootNode.search("ice4")}")
    }

    @Test
    fun testGeeksProblem() {
        /*
           Taking reference from geeks for geeks problem
           https://www.geeksforgeeks.org/word-break-problem-trie-solution/
           Basic motivation is to build a dictionary
    */

        fun TrieNode.searchProblem(root: TrieNode, word: String) : Boolean {
            // actual problem of geeks for geeks.
            if (word.isEmpty()) { return true }
            val node = childs[word.first()] ?: return false
            if (node.complete) {
                return root.searchProblem(root, word.drop(1))
            }
            return node.searchProblem(root, word.drop(1))
        }

        val rootNode = buildAlphabetTrie(mutableListOf<String>("i", "like", "sam", "sung", "samsung", "mobile", "ice",
            "cream", "icecream", "man", "go", "mango"))
        println("Does exist ${rootNode.searchProblem(rootNode, "ilike")}")
        println("Does exist ${rootNode.searchProblem(rootNode, "ilikesamsung")}")
        println("Does exist ${rootNode.searchProblem(rootNode, "i")}")
        println("Does exist ${rootNode.searchProblem(rootNode, "song")}")
    }

    private fun buildAlphabetTrie(list: MutableList<String>) : TrieNode {
        val node = TrieNode(false)
        for (l in list) {
            node.add(l)
        }
        return node
    }
}