/*
 1. This is the advance versions in swift.
 2. It is basically a chain of functions, a function passing as argument in another funtion.
 3. Functions and closures are first class members in swift they can be assigned to variable and passed around.
 4. Closures can also be used instead of functions it depends on the design pattern.
 */

import Foundation


class HighOrderFunction{
    
    
    class Arthematics{
        
        func addition (x:Double , y:Double) -> Double {
            return (x+y)
        }
        
        func subtraction (x:Double, y:Double) -> Double{
            return abs(x-y);
        }
        
        func returnMathOperation (isAdd : Bool) -> (Double, Double)->Double{
            func add (x:Double, y:Double) ->Double{
                return (x+y);
            }
            func sub (x:Double, y:Double)->Double{
                return (x-y);
            }
            return (isAdd ? add : sub);
        }
        
        func doMathOperation (operation : (_ x:Double,_ y:Double) -> Double, param1:Double, param2:Double) -> Double{
            return operation(param1, param2)
        }
        
        func test (){
            // can declare function as a variable. This concept is similar to python.
            let add = addition(x:y:);
            let result = self.doMathOperation(operation:add, param1: 3.2, param2: 2.1);
            print("Result \(result)");
            
            
            let addOperation = returnMathOperation(isAdd: false);
            print("Add Operation \(addOperation(2.4, 4.3))");
        }
    }
    
    
    // I am insane so trying this 🤓🤪
    struct RecursionObject{
        
        var a : Int = 0;
        func recursiveFunc (adder : Int) -> Int{
            return (a + adder);
        }
        
        // Blunder, if a function does not have a return type then the function parameter is treated as tupple, swift is confused. 🤪
        mutating func wrapperFunc (operation:(_ x:Int) -> Int) {
            a = operation(a);
            printAll();
        }
        
        // functions as object should be called after initialisers.
        var rf:Any?
        
        func printAll () {
            print("a \(a)")
        }
        
        init () {
            rf = recursiveFunc(adder:);
        }
        
    }
    
    class Recursion{
        
        func printAll (){
            var ro : RecursionObject = RecursionObject();
            // why does it giving warning. a function variable is expecting s return not, not understanding that function is returning nothing.
            ro.wrapperFunc(operation: ro.rf as! (Int) -> Int);
        }
        
    }
    
    func debugAll(){
        
        print("------------------------------")
        let arth = Arthematics();
        arth.test();
        
        let rec = Recursion();
        rec.printAll();
        
        globalFunctions();
        
        customHigherOrder();
    }
    
    func customHigherOrder() {
        
        func multiply(_ x:Int, y:Int) -> Int {
            return x*y;
        }
        
        func addition(_ x:Int, y: Int) -> Int {
            return x+y;
        }
        
        func doMath(operation: (_ x: Int, _ y: Int) -> Int, x: Int, y: Int) -> Int {
            return operation(x, y);
        }
        
        print("Math Operation Multiply : \(doMath(operation: addition(_:y:), x: 3, y: 3))");
    }
}


func globalFunctions() {
    for i in stride(from: 0.1, to: 0.2, by: 0.01){
        print(i);
    }
}

