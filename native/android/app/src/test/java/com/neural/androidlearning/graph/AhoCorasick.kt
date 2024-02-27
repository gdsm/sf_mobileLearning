package com.neural.androidlearning.graph

import junit.framework.Assert.assertEquals
import junit.framework.Assert.assertNotNull
import org.junit.Assert.*
import org.junit.Test


// get All suffix of String
// O(String-LEN)
private fun String.getAllSuffix() : List<String> {
    if (this.isEmpty()) { return mutableListOf("") }
    val suffix = mutableListOf<String>()
    var input = this
    while (input.isNotEmpty()) {
        input = input.drop(1)
        suffix.add(input)
    }
    return suffix
}

class AhoCorasick {

    class TrieNode(val value: String, var final: Boolean = false) {
        private val childs = mutableMapOf<Char, TrieNode>()
        lateinit var failureLink : TrieNode
        var outputLink : TrieNode? = null

        // add a string to TRIE dataStructure.
        // Get First O(1) + Fetch From Childs O(1) + Word Traversing O(WORD-LEN) + mapInsertion O(26)
        fun add(word: String) {
            if (word.isEmpty()) { return }
            val first = word.first()
            val node = childs[first] ?: TrieNode(value + first.toString())
            node.final = node.final || word.count() == 1
            node.add(word.drop(1))
            childs[first] = node
        }

        fun search(word: String) : List<String> {
            val wordsSearched = mutableListOf<String>()
            if (word.isEmpty()) { return wordsSearched }
            val node = childs[word.first()]

            wordsSearched += if (node != null) {
                if (node.final) {
                    wordsSearched.add(node.value)
                    if (node.failureLink.final) {
                        wordsSearched.add(node.failureLink.value)
                    }
                }
                if ((node != node.outputLink) && (node.outputLink?.final == true)) {
                    wordsSearched.add(node.outputLink!!.value)
                }
                node.search(word.drop(1))
            } else {
                if (value.isNotEmpty() && failureLink.value == value.last().toString()) {
                    failureLink.search(word)
                } else {
                    failureLink.search(word.drop(1))
                }
            }
            return wordsSearched
        }

        // Get a particular value from TRIE
        // Word Traversing O(WORD-LEN)
        fun getNode(word: String, isFinal: Boolean = false) : TrieNode? {
            if (word.isEmpty()) { return this }
            val node = childs[word.first()] ?: return null
            if (word.count() == 1) {
                if (isFinal) {
                    return if (node.final) { node } else { null }
                } else {
                    return node
                }
            }
            return node.getNode(word.drop(1))
        }

        // get the TrieNode with largest suffix
        // O(WORD-LEN)
        fun getLargestSuffixNode(suffix: List<String>): TrieNode? {
            for (i in 0 until suffix.count()) {
                if (suffix[i].isEmpty()) { continue }
                val node = getNode(suffix[i])
                if (node != null) {
                    return node
                }
            }
            return null
        }

        // Actual prepration of Failure Links
        // O(WORD-LEN * NUM-OF-WORDS * O(WORD-LEN))
        fun prepareFailureLinks(rootNode: TrieNode) {
            failureLink = rootNode.getLargestSuffixNode(value.getAllSuffix()) ?: rootNode
            for ((k, node) in childs) {
                node.prepareFailureLinks(rootNode)
            }
        }

        // Method to prepare output links
        // O(WORD-LEN * NUM-OF-WORDS * O(WORD-LEN))
        fun prepareOutputLink(rootNode: TrieNode) {
            if (value.isNotEmpty()) {
                outputLink = rootNode.getNode(value.last().toString(), true)
            }
            for ((k, node) in childs) {
                node.prepareOutputLink(rootNode)
            }
        }
    }

    @Test
    fun testTrie() {
        val input = mutableListOf<String>("ABC", "CAT", "GCG", "ACC", "A", "B")
        val rootNode = TrieNode("", false)
        for (str in input) {
            rootNode.add(str)
        }

        var node = rootNode.getNode("A")
        assertNotNull(node)
        assertEquals("A", node!!.value)

        node = rootNode.getNode("ABC")
        assertNotNull(node)
        assertEquals("ABC", node!!.value)

        node = rootNode.getNode("DEF")
        assertNull(node)
    }

    @Test
    fun testStringSuffix() {
        assertEquals(listOf<String>("BCD", "CD", "D", ""), "ABCD".getAllSuffix())
        assertEquals(listOf<String>("GG", "G", ""), "GGG".getAllSuffix())
        assertNotEquals(listOf<String>("CD", "C", ""), "CD".getAllSuffix())
    }

    @Test
    fun getLargestSuffixNode() {
        val input = mutableListOf<String>("ABC", "CAT", "GCG", "AT", "ACC", "A", "B", "AGZ")
        val rootNode = TrieNode("", false)
        for (str in input) {
            rootNode.add(str)
        }

        var node = rootNode.getNode("ABC")
        assertNotNull(node)
        var sNode = rootNode.getLargestSuffixNode(node!!.value.getAllSuffix())
        assertNotNull(sNode)
        assertEquals(sNode!!.value, "C")

        node = rootNode.getNode("CAT")
        assertNotNull(node)
        sNode = rootNode.getLargestSuffixNode(node!!.value.getAllSuffix())
        assertNotNull(sNode)
        assertEquals(sNode!!.value, "AT")

        node = rootNode.getNode("AGZ")
        assertNotNull(node)
        sNode = rootNode.getLargestSuffixNode(node!!.value.getAllSuffix())
        assertNull(sNode)
    }

    @Test
    fun prepareFailureLinks() {
        val input = mutableListOf<String>("ABC", "CAT", "AT", "B")
        val rootNode = TrieNode("", false)
        for (str in input) {
            rootNode.add(str)
        }

        rootNode.prepareFailureLinks(rootNode)

        var node = rootNode.getNode("B", true)
        assertNotNull(node)
        assertEquals(node!!.failureLink, rootNode)

        node = rootNode.getNode("ABC", true)
        assertNotNull(node)
        assertEquals(node!!.failureLink.value, "C")

        node = rootNode.getNode("AB")
        assertNotNull(node)
        assertEquals(node!!.failureLink.value, "B")

        node = rootNode.getNode("CAT")
        assertNotNull(node)
        assertEquals(node!!.failureLink.value, "AT")
    }

    @Test
    fun prepareOutputLinks() {
        val input = mutableListOf<String>("ABC", "CAT", "B")
        val rootNode = TrieNode("", false)
        for (str in input) {
            rootNode.add(str)
        }

        rootNode.prepareOutputLink(rootNode)

        var node = rootNode.getNode("AB")
        assertNotNull(node)
        assertNotNull(node!!.outputLink)
        assertTrue(node!!.outputLink!!.final)
        assertEquals(node!!.outputLink!!.value, "B")

        node = rootNode.getNode("A")
        assertNotNull(node)
        assertNull(node!!.outputLink)
    }

    @Test
    fun finallyTestTrie() {
        val input = mutableListOf<String>("ABC", "A", "BAT", "AGZ", "CAT", "AT")
        val rootNode = TrieNode("", false)
        for (str in input) {
            rootNode.add(str)
        }

        rootNode.prepareFailureLinks(rootNode)
        rootNode.prepareOutputLink(rootNode)

        assertEquals(rootNode.search("ABC").count(), 2)
        assertEquals(rootNode.search("GZ").count(), 0)
        assertEquals(rootNode.search("ABAT").count(), 4)
        assertEquals(rootNode.search("C").count(), 0)
    }
}