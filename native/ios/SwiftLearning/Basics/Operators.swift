/*
 1. Tuple comparison is avaliable for < 7 operators. >=7 operators needs to implement by own.
 */

import Foundation

class Operators{
    let (x, y) = (11, 13)
    
    func debug () {
        print("\(y%x)");
        
        var val = (4, "Three") < (4, "Four"); // this perform AND operation.
        print("\(val)")
        
        //val = (4, 5, 6) < (4, 5); // Compiler error !! tuple mismatch.
        //print("\(val)")
        
        val = (1, 2, 3, 4, 5, 6) == (1, 2, 3, 4, 0, 6);
        print("\(val)")

        //val = (false) < (true); // compile time error !! Bools cannot be processed like this
        //print("\(val)")
        
        
        // NIL-Coalescing operator
        let v1:Int? = 1;
        let v2:Int = 2;
        let v3 = v1 ?? v2;
        print("\(v3)")
        
        reverseString()
        
        
        var xPtr = 10;
        withUnsafePointer(to: &xPtr) { print("Printing memory address \($0)") }
    }
    
    func rangeOperators () {
        let array = ["1", "2", "3", "4"]
        
        print("Closed Range");
        
        // this is closed range
        for val in 0...array.count{
            print("\(val)");
        }

        print("Open Range");
        // this is open range
        for val in 0..<array.count{
            print("\(val)");
        }

        print("One Side Range");
        // this is open range
        for val in array[2...]{
            print("\(val)");
        }
        for val in array[...2]{
            print("\(val)");
        }
    }
    
    func reverseString (){
        var str = "This is a String"
        var rev : String = "";
        
        var iterator = str.count;
        
        while (iterator > 0){
            rev.append(str.last ?? Character(""));
            let range = str.index(str.endIndex, offsetBy: -1)..<str.endIndex;
            str.removeSubrange(range);
            
            print("Reverse : \(rev)");
            iterator -= 1;
        }
    }
}
