/*
 1. Maps are defiend to used on collections to perform collective operations.
 */

import Foundation

class Maps{
    
   
    class ArrayMaps{
        
        let array = [1,2,3,4,5];
        
        func closureMultiplyBy (value : Int) -> [Int] {
            // way 1...
            var newArray : [Int] = array.map({$0 * value});
            
            // way 2....
            newArray = array.map({(someInt : Int) -> Int in {
                return someInt * value;
                }()
            })
            
            // there can be other ways too, it depends on the design pattern. Argument is a closure traversing collection so a closure can be designed any way...
            return newArray;
        }
        
        func functionMultipleyBy(value : Int ) -> [Int] {
            
            // map argument can be function also.

            func multiply (collectionValue : Int) -> Int {
                return (collectionValue * value)
            }
            
            let newArray : [Int] = array.map(multiply(collectionValue:));
            
            return newArray;
        }
        
        func printMap (){
            print("Array\(array)");
            print("Closure Map \(self.closureMultiplyBy(value: 10))");
            print("Function Map \(self.functionMultipleyBy(value: 10))");
        }
    }
    
    class DictionaryMaps{
        
        let dict = ["K1":1, "K2":2];
        
        // strange : this returns array. In this case it is array of Tupples. So a map over dictionary converts the iterator to array.
        func closureMultiplyBy (_ multiplier : Int) -> [(String, Int)]{
            let newDict = dict.map({ (key, value) in
                                return (key,value*multiplier);
                            })
            return newDict;
        }
        
        func printMap (){
            print("Dict \(dict)");
            print("Multiplier \(closureMultiplyBy(10))");
        }
        
    }
    
    func sampleProblem()
    {
        let dict = [1:"One", 2:"Two", 3:"Three", 4:"Four"];
        let data = [12, 123, 24];
        
        let result: [String] = data.map({ (i1) in
            let s = String(i1);
            let s2: [String] = s.flatMap({ (i2) in
                let i: Int = (Int(String(i2)))!;
                return dict[i];
            });

            return s2.joined();
        });
        print("Result : ", result)
    }
    
//    func sampleProblem2() {
//        let dict = [1:"One", 2:"Two", 3:"Three", 4:"Four"];
//        let data = [12, 123, 24];
//        
//        func getValue(_ i: Int) -> Int{
//            var v : String? = nil;
//            if (i>10){
//                r = getValue(i/10);
//            }else{
//                r = dict[(i%10)];
//            }
//            return r;
//        }
//    }
    
    func sameplProblem3() {
        // custom higher order functions
        let ar = [1, 2, 3, 4, 5, 6];
        func multiply(_ x:Int) -> Int {
            return x*x;
        }
        let result = ar.multiplierMap(multiply, value: ar);
        print("Multiplier map result : \(result)");
    }
    
    func sampleProblem4() {
        let ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]
        var dict : [Int : Int] = [:]
        var pairs = 0
        
        ar.forEach({
            var value = (dict[$0] ?? 0) + 1
            if (value % 2) == 0 {
                pairs = pairs + 1
                value = 0
            }
            dict[$0] = value
        })
        
    }
    
    func debugAll(){
        print("------------------------------")
//        let am = ArrayMaps();
//        am.printMap();
//        print("------------------------------")
//        let dm = DictionaryMaps();
//        dm.printMap();
//        self.sampleProblem();
//        self.sameplProblem3();
    }
    
}

fileprivate extension Array {

    func multiplierMap(_ mFunc: (Int)->Int, value: [Int]) -> [Int] {
        let retVal: [Int] = value.map({return mFunc($0)});
        return retVal;
    }
    
}
