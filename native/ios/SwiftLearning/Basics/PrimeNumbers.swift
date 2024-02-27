//
//  PrimeNumbers.swift
//  SwiftLearning
//
//  Created by Gagan on 24/04/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation

class TestPrimeNumers {
    func debugAll() {
        let p = PrimeNumbers()
        let _ = p.generatePrimeNumberSeries(100);
    }
}


private class PrimeNumbers {
    
    func generatePrimeNumberSeries(_ count: Int) -> [Int] {
        var numbersGenerated = 0;
        var counter = 2;
        var retVal : [Int] = [];
        
        while (numbersGenerated < count) {
            
            if (isPrimeNumber(num: counter)) {
                numbersGenerated += 1;
                retVal.append(counter)
            }
            
            counter = counter + 1;
        }
        
        print("Prime Number Series \(retVal)")
        
        return retVal;
    }
    
    private func isPrimeNumber(num: Int) -> Bool{
        
        if (num < 2) {
            return false;
        }
        
        let factors = self.factors(num: num);
        
        if factors.count == 2{
            return true
        }
        return false;
    }
    
    private func factors(num : Int) -> [Int] {
        var retVal: [Int] = [];
        retVal.append(1); // 1 should always be the factor.
        retVal.append(num); // number itself would be the factor

        if (num <= 2){
            // for 1 is there is only 1 factor number
            return retVal;
        }

        var start = 2;
        let end = (num/2) + 1;
        
        while (start <= end) {
            if Int(num % start) == 0{
                //this is divisible;
                retVal.append(start);
            }
            start = start + 1;
        }

        return retVal;
    }
}
