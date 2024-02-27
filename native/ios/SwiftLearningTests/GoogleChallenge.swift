//
//  GoogleChallenge.swift
//  SwiftLearningTests
//
//  Created by Gagan on 12/06/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

import XCTest

class GoogleChallenge: XCTestCase {
    
    typealias Block = (gym: Bool, school: Bool, store: Bool)
    private let gym = "gym"
    private let school = "school"
    private let store = "store"
    private let infinity = 9999999999

    func testFarthestDistance() {
        // https://www.youtube.com/watch?v=rw4s4M3hFfs&t=1554s
        let sampleInput = [Block(gym: false, school: true, store: false),
                      Block(gym: true, school: false, store: false),
                      Block(gym: true, school: true, store: false),
                      Block(gym: false, school: true, store: true)]
        
        func updatedTarget(block: Block, target: [String]) -> [String] {
            var updatedTarget = target
            if block.gym {
                updatedTarget.removeAll(where: { $0 == gym })
            }
            if block.store {
                updatedTarget.removeAll(where: { $0 == store })
            }
            if block.school {
                updatedTarget.removeAll(where: { $0 == school })
            }
            return updatedTarget
        }
        
        func getCost(blocks: [Block], src: Int, targets: [String]) -> Int {
            if (src < 0) || (src >= blocks.count) {
                return infinity
            }
            if targets.isEmpty {
                // there are no targets
                return 0
            }
            
            let updatedTargets = updatedTarget(block: blocks[src], target: targets)
            if updatedTargets.isEmpty {
                // In current block we have figured out all our targets
                return 1
            }
            var letfCost = 1
            var rightCost = 1
            var leftBlocks : [Block] = []
            var rightBlocks : [Block] = []
            for i in 0..<blocks.count {
                if i < src {
                    leftBlocks.append(blocks[i])
                } else if i > src {
                    rightBlocks.append(blocks[i])
                }
            }
            if leftBlocks.isEmpty && !updatedTargets.isEmpty {
                letfCost = infinity
            } else {
                letfCost += getCost(blocks: leftBlocks, src: leftBlocks.count-1, targets: updatedTargets)
            }
            if rightBlocks.isEmpty && !updatedTargets.isEmpty {
                rightCost = infinity
            } else {
                rightCost += getCost(blocks: rightBlocks, src: 0, targets: updatedTargets)
            }

            return min(letfCost, rightCost)
        }
        
        // O(blocks.count ^ 2)
        func solve(blocks: [Block], targets: [String]) -> Int {
            var result = -1
            var cost = infinity
            for i in 0..<blocks.count {
                let c = getCost(blocks: blocks, src: i, targets: targets)
                if (c < cost) {
                    result = i
                    cost = c
                }
            }
            return result
        }
        XCTAssertEqual(solve(blocks: sampleInput, targets: [school, gym, store]), 2)
    }

}



/**
 
 Failed Attemp
 
 var bfsQueue : [Int] = []
 
 func getBlock(graph: [[String: Bool]], targets: [String]) -> Int {
 var cost = 999999999999999999
 var minIdx = -1
 for i in 0..<blocks.count {
 bfsQueue = [i]
 let c = bfs(graph: graph, targets: targets, visited: [])
 if (c >= 0) && (c < cost) {
 cost = c
 minIdx = i
 }
 }
 return minIdx
 }
 
 func bfs(
 graph: [[String: Bool]],
 targets: [String],
 visited: [Int]
 ) -> Int {
 // return Cost to reach destination
 if (bfsQueue.isEmpty || targets.isEmpty) {
 return 0
 }
 let src = bfsQueue.removeFirst()
 let leftNeighbour = src - 1
 if leftNeighbour >= 0 && !visited.contains(leftNeighbour) {
 bfsQueue.append(leftNeighbour)
 }
 let rightNeighbour = src + 1
 if rightNeighbour < graph.count && !visited.contains(rightNeighbour) {
 bfsQueue.append(rightNeighbour)
 }
 
 var target = targets
 for t in targets {
 if graph[src][t] ?? false {
 target.removeAll(where: { $0 == t })
 }
 }
 
 var cost = 0
 if (targets.count > 0) {
 cost = bfs(graph: graph, targets: target, visited: visited + [src]) + 1
 }
 
 return cost
 }
 

 
 
 
 
 */
