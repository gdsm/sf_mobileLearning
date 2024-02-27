//
//  Dispatch.swift
//  SwiftLearning
//
//  Created by Gagan on 23/04/19.
//  Copyright © 2019 Gagan. All rights reserved.
//


/*
 1. DispatchQueues are FIFO
 2. Tasks are submitted in the form of block object.
 3. Can Work in Serial or concurrent
 */
import Foundation

class Dispatch{
    
    let main = DispatchQueue.main;
    
    func debugAll() {
//        test1();
//        test3();
//        test2();
//        test4();
//        test5()
//        test6();
//        test7();
        test8();
    }
    
    
    func test1() {
        let background = DispatchQueue.global()
        
        func doSyncWork() {
            background.sync {
                for _ in 1...3 {
                    print("Light")
                }
            }
            for _ in 1...3 {
                print("Heavy")
            }
        }
        doSyncWork();
    }

    func test2() {
        let main = DispatchQueue.main
        let background = DispatchQueue.global()
        var num: Int = 0;
        
        func doAsyncWork() {
            background.async {
                for _ in 1...3 {
                    num = num+1;
                    print("Test2: Light \(num)")
                }
            }
            for _ in 1...3 {
                num = num+1;
                print("Test2: Heavy \(num)")
            }
        }
        doAsyncWork();
    }
    
    func test3() {
        let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .background) // lower importance
        let blackWorker = DispatchQueue(label: "construction_worker_4", qos: .userInitiated) // higher importance
        
        func doLightWorks() {
            whiteWorker.async { for _ in 1...10 { print("Test3: 👷🏻") } }
            blackWorker.async { for _ in 1...10 { print("Test3: 👷🏾") } }
        }
        doLightWorks()
    }
    
    func test4() {
        let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .background) // lower importance
        let blackWorker = DispatchQueue(label: "construction_worker_4", qos: .background) // higher importance
        
        let sem = DispatchSemaphore(value: 1);
        var num : Int = 0;
        
        
        func doLightWorks() {
            whiteWorker.async {
                for _ in 1...300 {
                    sem.wait();
                    num = num + 1;
                    print("Test4: 👷🏻 : num : \(num)")
                    sem.signal();
                }
            }
            blackWorker.async {
                for _ in 1...300 {
                    sem.wait();
                    num = num - 1;
                    print("Test4: 👷🏾 : num : \(num)")
                    sem.signal();
                }
            }
        }
        doLightWorks()
    }
    
    func test5() {
        let group = DispatchGroup();
        let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .background) // lower importance
        let blackWorker = DispatchQueue(label: "construction_worker_4", qos: .background) // higher importance

        group.notify(queue: whiteWorker) {
            print("White worker notified")
        }
        group.notify(queue: blackWorker) {
            print("Black worker notified")
        }
    }
    
    
    
    func test6() {
        
        let limit = 10;
        
        for i in 1...limit {
            print("Before DispatchQueue.main.async \(i)")
            DispatchQueue.main.async {
                print("Inside: DispatchQueue.main.async : \(i)");
            }
        }
        
//        // This will result in crash.
//        DispatchQueue.main.sync {
//            print("Dispatch Main Queue Sync");
//        }

        for i in 1...limit {
            print("Before DispatchQueue.global().async \(i)")
            DispatchQueue.global().async {
                print("Inside DispatchQueue.global().async \(i)");
            }
        }


        for i in 1...limit {
            print("Before DispatchQueue.global().sync \(i)")
            DispatchQueue.global().sync {
                print("Inside DispatchQueue.global().sync \(i)");
            }
        }
    }
    
    func test7() {
        let q1 = DispatchQueue(label: "Queue 1", qos: .userInitiated)
        let q2 = DispatchQueue(label: "Queue 2", qos: .userInitiated)
        let q3 = DispatchQueue(label: "Queue 3", qos: .userInitiated)


        let limit = 10;
        
        q3.async {
            for i in 1...limit {
                print("Before q1.async \(i)");
                q1.async {
                    print("After q1.async \(i)")
                }
            }

            for i in 1...limit {
                print("Before q2.async \(i)≥");
                q2.async {
                    print("After q2.async \(i)")
                }
            }
        }
    }


    func test8() {
        let q1 = DispatchQueue(label: "Queue 1", qos: .userInitiated)
        let q2 = DispatchQueue(label: "Queue 2", qos: .userInitiated)
        
        let limit = 10;
        
        q1.async(execute: {
            for i in 1...limit {
                DispatchQueue.main.sync {
                    print("DispatchQueue.main.sync \(i)")
                }
            }
        })


        q2.async(execute: {
            for i in 1...limit {
                DispatchQueue.main.async {
                    print("DispatchQueue.main.async \(i)")
                }
            }
        })
    }
}




