
import Foundation



typealias GInt = Int64; // this is typedef in swift. There is no such major difference found in typedef and typealias
//typealias this = self; 🤣🤓 I am completely insane i am trying this.

class Constants {
    let int : Int = Int.max // By default this is 64 bit. In Kotlin this is by default 32 bit..
    let int8 : Int8 = Int8.max // Int is a structure in swift where as it is datatype in c.
    let int16 : Int16 = Int16.max
    // this result in build time overflow error.
//    let int16 : Int16 = Int16.max + 1
    let int32 : Int32 = Int32.max
    let int64 : Int64 = Int64.max
    let aliasInt : GInt = GInt.max;
    
    let uint : UInt = UInt.max;
    let uint8 : UInt8 = UInt8.max;
    let uint16 : UInt16 = UInt16.max;
    let uint32 : UInt32 = UInt32.max;
    let uint64 : UInt64 = UInt64.max;
    
    //UInt8 and UInt16 cannot be added direc
    
    let ascii : String = "I am ascii string"
    let utf : String = "I am UTF String 🐶🐮🦁" // this is not allowed in kotlin.
    
    let dbl_t : double_t = 0.199999999999999999999999999999999999999999999999999998
    let dbl : Double = 0.199999999999999999999999999999999999999999999999999998
    let cdbl : CDouble = 0.199999999999999999999999999999999999999999999999999998
    let __dbl : __double2 = __double2(__sinval : 0.1, __cosval : 0.1);
    let expDbl : Double = 1.25e2;
    
    let binary : Int = 0b1001;
    let octal : Int = 0o1001;
    let hexa : Int = 0x1001;
    
    let optionalInt : Int? = 15;

    func printAll (){
        
        print("Int : \(int)")
        print("Int8 : \(int8)")
        print("Int16 : \(int16)")
        print("Int32 : \(int32)")
        print("Int64 : \(int64)")
        print("GInt : \(aliasInt)")

        print("UInt : \(uint)")
        print("UInt8 : \(uint8)")
        print("UInt16 : \(uint16)")
        print("UInt32 : \(uint32)")
        print("UInt64 : \(uint64)")
        
        print("Ascii String : \(ascii)")
        print("UTF String : \(utf)")

        print("double_t: \(dbl_t)")
        print("double: \(dbl)")
        print("CDouble: \(cdbl)")
        print("__double2: \(__dbl)")
        print("Exponential Double: \(expDbl)")

        print("binary: \(binary)")
        print("octal: \(octal)")
        print("hexa: \(hexa)")

        print("Optional Int : \(optionalInt)"); //Optional(15)
        print("Optional Int Type: \(type(of: optionalInt))"); //Optional<Int>

        // uncomment the lines and observe the error. String cannot be initialized with nil value which can produce optional result.
//        let s : String? = String(nil) as String?;
//        let i : Int? = Int(nil);
//        print("String with nil \(s)")
//        print("Integer with nil \(i)")
        
        
        
        // interesting hash values depends on contents. This is how values are stored in set. Same value results in same hash
        let a1 = "String 1";
        let a2 = "String 2";
        print("Hash Value a1: \(a1.hashValue)")
        print("Hash Value a2: \(a2.hashValue)")
        
        var dict : [String:String] = Dictionary();
        dict["key"] = "value";
        print("Dictionary : \(dict)");
        //dictionaries are not hashable.
        
        
    }
}


class variables {
    var int : Int = Int.max
    var int8 : Int8 = Int8.max
    var int16 : Int16 = Int16.max
    var int32 : Int32 = Int32.max
    var int64 : Int64 = Int64.max
    
    var uint : UInt = UInt.max;
    var uint8 : UInt8 = UInt8.max;
    var uint16 : UInt16 = UInt16.max;
    var uint32 : UInt32 = UInt32.max;
    var uint64 : UInt64 = UInt64.max;
    
    var ascii : String = "I am ascii string"
    var utf : String = "I am UTF String 🐶🐮🦁"
}

