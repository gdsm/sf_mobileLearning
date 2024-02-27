//
//  SwiftLearningTests.swift
//  SwiftLearningTests
//
//  Created by Gagandeep Madan on 18/09/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import XCTest

class SwiftLearningTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func squareroot(_ x:Int) -> Double {
        var res = sqrt(Double(x));
        res = sqrt(res);
        res = sqrt(res);
        res = sqrt(res);
        res = sqrt(res);
        res = sqrt(res);
        res = sqrt(res);
        res = sqrt(res);
        res = pow(res, 2.15245)
        res = pow(res, 0.9874587)
        res = pow(res, 1.0254879645)
        return res;
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHOF_1() {
        let req: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
        self.measure {
            for i in req {
                print("{Number : \(i)} : {Sqrt : \(squareroot(i))}")
            }
        }
        /*
         [0.001781, 0.000248, 0.000526, 0.000331, 0.000326, 0.000384, 0.000322, 0.000316, 0.000374, 0.000343]
         */
    }

    func testHOF_2() {
        let req: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        self.measure {
            let _ = req.map({ (arg) -> Double in
                let res = squareroot(arg)
                print("{Number : \(arg)} : {Sqrt : \(arg)}")
                return res;
            });
        }
        /*
         [0.000308, 0.000121, 0.000146, 0.000121, 0.000256, 0.000271, 0.000190, 0.000189, 0.000127, 0.000212]
         */
    }

    func testHOF_3() {
        func multiplierMap(_ mFunc: (Int)->Double, value: [Int]) -> [Double] {
            let retVal: [Double] = value.map({return squareroot($0)});
            return retVal;
        }
        let req: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        self.measure {
            let res = multiplierMap(squareroot(_:), value: req);
            print("Result \(res)");
        }
        /*
         [0.000311, 0.000130, 0.000079, 0.000125, 0.000072, 0.000076, 0.000062, 0.000061, 0.000254, 0.000066]
         */
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
