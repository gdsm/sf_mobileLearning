//
//  AsyncProgramming.swift
//  SwiftLearning
//
//  Created by Gagandeep on 11/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import Combine


/**

 - async:
 
 - Task:
 Similar to coroutine but not exactly Thread management like CoRoutine. Used to instantiate async block. Multiple tasks can run in parallel
 
 - TaskGroup
Combine multiple Tasks.
 
 - AnyPublisher: Use as decorator for other publisher, Intent is to not expose wrapped pulisher.
 
 */

enum TestError: Error {
    case test
}

class AsyncProgramming {
    static let sharedInstance = AsyncProgramming()
    private let locationManger = LocationManager()
    private var testTimer: Timer?
    
    private var compassHeadingCancellation: Cancellable?
    
    private var testFuture: Future<Int, Never>?
    private var testFutureCancellable1: Cancellable?
    private var testFutureCancellable2: Cancellable?

    private var testJust: Just<String>?
    private var testJustCancellable1: Cancellable?
    private var testJustCancellable2: Cancellable?

    private var testRecord: Record<Array<Int>, TestError>?

    private var testConnetableCancellable1: Cancellable?
    private var testConnetableCancellable2: Cancellable?
    private var testConnetableCancellable3: Cancellable?
    
    private var passthroughtPublisher: PassthroughSubject<Int, TestError>?
    private var currentValuePublisher: CurrentValueSubject<Int, TestError>?
    private var passthroughtCancellable1: Cancellable?
    private var passthroughtCancellable2: Cancellable?
    private var currentValueCancellable1: Cancellable?
    private var currentValueCancellable2: Cancellable?
    
    private var testAsyncPub: AsyncPublisher<Future<Int, Never>>?

    
    class TestPublished {
        @Published var temperature: Double
        init(temperature: Double) {
            self.temperature = temperature
        }
    }
    
    private init() {
        
    }
    
    func initialize() {
//        startCompassHeading()
//        testPubSub()
        Task {
            print("started testingh async.")
            await testAsync()
            print("completed testingh async.")
        }
    }
    
    func startCompassHeading() {
        Task {
            print("AsyncProgramming : Entered in task")
            let future = locationManger.getMagneticHeading()
            compassHeadingCancellation = future.sink { subscriber in
                print("Received completion of subscriber in sink.")
            } receiveValue: { value in
                print("Received subscriber value in sink. \(value)")
            }
        }
    }
    
    func stopCompassHeading() {
        compassHeadingCancellation?.cancel()
    }
    
    private func testPubSub() {
        Task {
            print("Testing @Published.")

            let test = TestPublished(temperature: 10)
            let cancellable = test.$temperature.sink { value in
                print("Received value in sink \(value)")
            }
            test.temperature = 30
            test.temperature = 40
        }
        
        Task {
            print("Testing Future.")
            testFuture = Future() { promise in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            let number = Int.random(in: 1...10)
                            promise(Result.success(number))
                }
            }

            testFutureCancellable1 = testFuture?.sink { value in
                print("1. Testing Future = \(value)")
            }
            
            testFutureCancellable2 = testFuture?.sink { value in
                print("2. Testing Future = \(value)")
            }
        }
        
        Task {
            print("Testing Just.")
            testJust = Just("PassValue1")

            testJustCancellable1 = testJust?.sink(receiveValue: { value in
                print("1. Testing Just. Received Just \(value)")
            })
            
            testJustCancellable2 = testJust?.sink(receiveValue: { value in
                print("2. Testing Just. Received Just \(value)")
            })
        }
        
//        Task {
//            print("Testing Record.")
//            let array = [1,2,3,4,5,6]
//            testRecord = Record(output: array, completion: .failure(TestError.test))
//            testRecord?.scan(0, { <#T#>, <#Array<Int>#> in
//                <#code#>
//            })
//
//            testJustCancellable1 = testJust?.sink(receiveValue: { value in
//                print("1. Received Just \(value)")
//            })
//            
//            testJustCancellable2 = testJust?.sink(receiveValue: { value in
//                print("2. Received Just \(value)")
//            })
//        }
        
        Task {
            print("Connectable publisher")
            let publisher = Just(5).makeConnectable()

            testConnetableCancellable1 = publisher.sink { newValue in
                print("1. Connectable publisher : \(newValue)")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.testConnetableCancellable2 = publisher.sink { newValue in
                    print("2. Connectable publisher : \(newValue)")
                }
                self.testConnetableCancellable3 = publisher.connect()
            }
        }
        
        Task {
            print("Testing PassthroughSubject and CurrentValueSubject.")
            
            passthroughtPublisher = PassthroughSubject()
            currentValuePublisher = CurrentValueSubject(0)
            
            for i in 1...2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.passthroughtPublisher?.send(i)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.currentValuePublisher?.send(i)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.passthroughtCancellable1 = self.passthroughtPublisher?.sink(receiveCompletion: {_ in
                    print("1. PassthroughSubject received completion")
                }, receiveValue: { value in
                    print("1. PassthroughSubject received value \(value)")
                })
                self.currentValueCancellable1 = self.currentValuePublisher?.sink(receiveCompletion: {_ in
                    print("1. currentValuePublisher received completion")
                }, receiveValue: { value in
                    print("1. currentValuePublisher received value \(value)")
                })
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.passthroughtCancellable2 = self.passthroughtPublisher?.sink(receiveCompletion: {_ in
                    print("2. PassthroughSubject received completion")
                }, receiveValue: { value in
                    print("2. PassthroughSubject received value \(value)")
                })
                self.currentValueCancellable2 = self.currentValuePublisher?.sink(receiveCompletion: {_ in
                    print("2. currentValuePublisher received completion")
                }, receiveValue: { value in
                    print("2. currentValuePublisher received value \(value)")
                })
            }
        }
    }
    
    private func testAsync() async {
        do {
            print("---> 1")
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("---> 2")
        } catch(let e) {
            
        }
    }
    
    
    private func someAsyncMethod() async throws {
        // Deferred Execution block is executed once a subscriber is connected.
        testAsyncPub = AsyncPublisher(
            Future<Int, Never>() { promise in
                print("Executing Future.")
                self.testTimer = Timer(timeInterval: 2, repeats: false) { t in
                    print("Executing Timer.")
                    promise(Result.success(1))
                }
            }
        )
        
        print("--> 1")
        let value = await testAsyncPub?.first { id in
            id == 1
        }
        print("Value --> \(value)")
    }
}
