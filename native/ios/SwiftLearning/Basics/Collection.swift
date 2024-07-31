
/*
 1. Sets are unordered collection.
 2. Swift Sets are briged to NSSet.
 3. Sets are un-ordered.
 4. Set must be give generic paramater type. Set<T>()
 */

import Foundation

class Collection{
    
    // Interesting Arrays are structures not class type, so they do not follow Object protocol, cannot be inherited from Array
//    class InheritArray : Array<Int>{
//
//    }
    // RULE : A class cannot inherit from strucure.
//    class InheritInt : Int{
//        
//    }
    
    func debugArray() {
        
        var emptyArr = [Int]();
        print("Empty Array : \(emptyArr)");
        
        emptyArr.append(1); // does not work on constants.
        print("Array : \(emptyArr)");
        
        
        //Fact : when defined in operators double value with high precision. The printed console value gets rounded. But when used with array its not.
        let arr1 = Array(repeating: 1.1, count: 2);
        let arr2 = Array(repeating: 1.1, count: 2);
        
        let arr3 = arr1+arr2;
        print("Array : \(arr1+arr2)");
        print("Array : \(arr3[3])");
        
        let str1 = ["Swift", "Is", "Interesting"]
        for (index, value) in str1.enumerated(){
            print("\(index)=\(value)");
        }
        
        for (a , b) in zip([1, 2, 3], [10, 20, 30]) {
            print("\(a) : \(b)")
        }
        
        debugArrayMemory()
        add2Nums()
        arraySlicing()
    }
    
    func arrayManipulation() -> Int {
        
        let n = 4
        let queries = [[2, 3, 603], [1, 1, 286], [4, 4, 882]]

        var maxValue = 0
        var array: [Int] = Array(repeating: 0, count: n)
        queries.forEach({
            let range: Range<Int> = ($0[0]-1)..<($0[1]-1)
            if (range.lowerBound <= range.upperBound) && (range.lowerBound >= 0) && (range.upperBound < array.count) {
                for value in range.lowerBound...range.upperBound {
                    array[value] = array[value] + ($0[2])
                }
            }
        })
        
        array.forEach({
            if $0 > maxValue {
                maxValue = $0
            }
        })
        return maxValue
    }

    func debugArrayMemory() {
        var arr : [Int] = Array<Int>();
        
        arr.append(1);
        let s = NSString(format: "Pointer -> %p", arr[0]);
        print(s);
        arr.append(2);
        print(unsafeBitCast(arr, to: Int.self))
    }
    
    func debugSets (){
        var set = Set<String>();
        set.insert("1");
        print("Set \(set)");
        
        var s1 = Set<CInt>();
        s1.insert(1);
        print("S1 : \(s1)")
        
//        var s2 = Set<(Int,String)>(); // Tuple cannot be passes as Type in set.
//        print("S2 : \(s2)")
    }
    
    func debugDictionaries (){

        // Dictionary is not hashable, So if a dictionary is not hashable then how does it is stored in Sets.
        
        func printDict (d : Dictionary<String, Any>){
        
            for (key, value) in d{
                print("Key \(key)");
                print("Value \(value)")
            }
        }
        
        var d1 : Dictionary<String, Any> = Dictionary<String, Any>();
        d1["k1"] = "v1";
        d1["k2"] = 2;
        printDict(d:d1);
        
        
        let d2 : Dictionary<String, Any> = ["K1":"V1", "K2":2];
        printDict(d: d2);
        

        // Build time error, Dictionary is not conformable to hashable protocol so cannot be used in sets.
        // Solution : Write extension class of dictionary. Weired behaviour from swift.🧐 May be this is intended that user should provide there own hash function...
//        var s1 : Set = Set<Dictionary>();
        //😳 Array is also not hashable.
//        var s2 : Set = Set<Array>();
    }
    
    func add2Nums() {
        func add<T: Numeric>(data: [T], initvalue: T) -> T {
            return data.reduce(initvalue) { partialResult, next in
                print("partialResult, Next ---> \(partialResult), \(next)")
                if (next.magnitude > 0) {
                    return partialResult + next
                } else {
                    return partialResult
                }
            }
        }


        let res = add(data: [1,2,3,-4,5,6], initvalue: 0)
        print("Result \(res)")
    }
    
    func arraySlicing() {
        // slice array from 1 to 4 index
        let unSlicedArray = [1,2,3,4,5,6,7]
        print("Sliced Array : \(unSlicedArray[1...4])")
        
        // Get all odd indexes
        let oddIdx = [1,2,3,4,5,6,7,8,9].filter { value in
            return (value % 2) != 0
        }
        print("Odd Idxes : \(oddIdx)")
    }
}
