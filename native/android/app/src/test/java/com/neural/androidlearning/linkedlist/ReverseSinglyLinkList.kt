package com.neural.androidlearning.linkedlist

import junit.framework.Assert.assertEquals
import org.junit.Test

class ReverseSinglyLinkList {

    data class Node(val data: Int, var next: Node?)

    @Test
    fun reverseNumericLinkList() {

        fun reverse(start: Node?) : Node? {
            if ((start == null) || (start.next == null)){
                return start
            }
            var p1 = start
            var p2 = p1.next
            var p3 = p2?.next
            p1.next = null

            while (p2 != null) {
                p2.next = p1
                p1 = p2
                p2 = p3
                p3 = p3?.next
            }

            return p1
        }

        val start = getLinkList(listOf<Int>(1,2,3,4))
        val reverse = getList(reverse(start))
        assertEquals(
            listOf<Int>(4,3,2,1),
            reverse
        )
    }

    private fun getList(node: Node?): List<Int> {
        var list = mutableListOf<Int>()
        var start = node
        while (start != null) {
            list.add(start.data)
            start = start.next
        }
        return list
    }

    private fun getLinkList(numbers: List<Int>) : Node {
        val start = Node(numbers.first(), null)
        var n: Node? = start
        for (i in 1 until numbers.count() ) {
            n?.next = Node(numbers[i], null)
            n = n?.next
        }
        return start
    }
}