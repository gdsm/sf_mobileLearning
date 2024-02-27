
/*
 ---> Tuples:
 1. Tupple can hold multiple values in a single data structure.
 2. Tuples are useful for representing what other languages often call records — some related information that belongs together, like your student record.
 3. Tuples are immutable objects there value cannot be changed. In terms of swift they does not support subscript.
 4. Tuples does not support sequence which means that tuples cannot be traversed by for loops.
 5. Tuples can be accessed by Tuple.Index (employee.0)
 6. Tuples are not HASHABLE
 */

import Foundation

class Tuples_Dictionaries{
    let tupple = (Int(5), UInt(6), String(5));
    let employee = (Age:30, Name:"John")
    
    var mutableTupple = ("Name", 6) // cannot change value
    
    
    func debug (){
        print("Tupple \(tupple)");
        print("Tupple Type \(type(of: tupple))"); //Tupple Type (Int, Int, String)
        

        print("Employee \(employee)");
        print("Employee \(type(of: employee))");

        let (eAge, eName) = employee;
        print("Age : \(eAge)");
        print("Name : \(eName)");
        
        // 🤣🤣🤣🤣🤣🤣 This is not allowed. This is supported in python.
//        let mutTupple = tupple[:1] + ("Mutable", "Tuple") + tupple[2:];
//        print("Name : \(mutTupple)");
        
    }
    
    func reverse_a_tuple (){
        let mainTuple = (1, 2, 3);
        let (t1, _, _) = mainTuple;
        let (_, t2, _) = mainTuple;
        let (_, _, t3) = mainTuple;
        let revTuple = (t3, t2, t1);
        print("Reverse Tuple : \(revTuple)");
    }
    
}

