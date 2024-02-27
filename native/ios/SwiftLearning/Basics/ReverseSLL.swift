//
//  ReverseSLL.swift
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 16/11/20.
//  Copyright © 2020 Gagan. All rights reserved.
//

import Foundation

class ReverseSLL {
    
    class Node {
        let value: Int
        var next: Node?
        
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    
    func printLL(_ ll: Node?) {
        var head: Node? = ll
        while (head != nil) {
            print("Element \(head!.value)")
            head = head?.next
        }
    }
        
    func debug() {
        let linkList = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: nil)))))
        printLL(linkList)
        
        var head : Node? = linkList
        var prev: Node? = head
        var curr: Node? = prev?.next
        var next: Node? = curr?.next
        prev?.next = nil
        
        while (curr != nil) {
            curr?.next = prev
            prev = curr
            curr = next
            next = next?.next
        }
        
        head = prev
        printLL(head)
    }

}
