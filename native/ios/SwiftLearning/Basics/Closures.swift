
import Foundation
import Swift

class Closures{

    typealias MaxString = (String, String) -> String;
    typealias MaxTuple = ((Int, Int), (Int, Int)) -> (Int, Int);
    typealias ShortClosure = (Double, Double) -> Double;
    typealias ValuePrinter = (Any) -> Void;

    let maxStr : MaxString = { (s1:String, s2:String) -> String in
        return (s1>s2) ? s1 : s2;
    };

    let maxTuple : MaxTuple = { (arg0, arg1) -> (Int, Int) in
        return (arg0>arg1) ? arg0 : arg1
    };
    
    /// this is implicit closure, short, crisp
    let sin_cos_implicit : ShortClosure = {a,b in (sin(a)+cos(b))}
    
    
    var capturelist_number = 0;
    lazy var weakCapturelist_clo : (Int) -> Void = { [weak self, capturelist_number] value in
        self?.capturelist_number += value;
        print("---> weakCapturelist_clo", self?.capturelist_number ?? 0, capturelist_number)
    }
    lazy var unoCapturelist_clo : (Int) -> Void = { [unowned self, capturelist_number] value in
        self.capturelist_number += value;
        print("---> unoCapturelist_clo", self.capturelist_number, capturelist_number)
    }
    lazy var strongCapturelist_clo : (Int) -> Void = { [self, capturelist_number] value in
        self.capturelist_number += value;
        print("---> unoCapturelist_clo", self.capturelist_number, capturelist_number)
    }

   
    func debugAll (){
//        testClosure();
//        weakCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)
//        unoCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)
//        strongCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)
//
//        weakCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)
//        unoCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)
//        strongCapturelist_clo(3);
//        print("---> capturelist_number", self.capturelist_number)

//        stackTrace {
//            print("-----> Stack trace from escaping closure");
//            Thread.callStackSymbols.forEach({print($0)});
//        }
        
        test2()
    }
    
    var clo1: (() -> Void)!
    var a1 = 10

    func test1() {
        a1 = a1 + 1;
        print("a1 \(a1)")
        clo1 = {[unowned self, a1] () -> Void in
            self.a1 = a1 + 1;
            print("a1 \(self.a1)")
        }
        
        let clo2 = { () -> Void in
            self.a1 = self.a1 + 1;
            print("a1 \(self.a1)")
        }

        a1 = a1 + 1;
        print("a1 \(a1)")
        
        clo1()
        clo2()
    }
    
    func testClosure (){
        let closure = { (s:String, i:Int) -> Bool in
            print("Closure String \(s)")
            print("Closure Int \(i)")
            return true;
        }
     
        let _ = closure("This is closure", 101);
        
        let s = maxStr("B", "AA");
        print("Max String : \(s)");
        
        let t = maxTuple((1, 2),(1,23));
        print("Max Tuple : \(t)");
        
        closureScope();

        // This is inline closure expression. This is useful for timings, it can avaoid additional functional stack in the process memory map.
        print("Short Closure \(self.sin_cos_implicit(0.2, 0.3))");
        /// more shorter closure. More the shorter more the specific it should be.
        calculateSinCos(clo: {sin($0)+cos($1)});
        
        
        print("Pythagoras : \(self.pythagoras(a: 2, b: 3))")
        
        escapingClosures();
    }
    
    
    // example for short hand closure. See the method calling.
    func calculateSinCos (clo:ShortClosure){
        print("Short Closure \(clo(0.2, 0.3))");
    }
    
    
    // example for funtion inside function.
    func pythagoras (a:Decimal, b:Decimal) -> Decimal {
        
        func squareValues () -> Decimal{
            // values a and b are captured by inner function.
            return (pow(a,2)+pow(b,2));
        }
        return squareValues();
    }
    
    func closureScope ()
    {
        // docs says that if a value is mutated inside closure then the values are passed by reference, if a value is not mutated inside closure then it is pass by value, docs says that this is for optimisation. REALLY????
        var i : Int = 10;
        print("closureScope : I = \(i)")
        let clo1 = { () in
            //i += 1;
            print("closureScope : I = \(i)")
        }
        i += 1;
        print("closureScope : I = \(i)")
        clo1();
    }
    
    func escapingClosures ()
    {
        // sudo code for escaping closure.
        
        // remove the @escaping keyword and see the compile time error.
        // Optional closures do not copy??
        
        
        print("----> Escaping Closure <-----")
        var printClo : ValuePrinter? = nil
        func computation (clo : @escaping ValuePrinter){
            // values can't be copied. without escaping.
            // Implecitly scope of parent functions is being copied.
            printClo = clo;
        }
        computation { (val) in
            print("Value : \(val)");
        }
        let clos = printClo!;
        clos("I am escaping closure");
    }
    
    
    func stackTrace (_ escClo: @escaping () -> ()) {
        
        func inlineStackTrace() {
            print("-----> Stack trace from inline functions");
            Thread.callStackSymbols.forEach({print($0)});
        }
        
        let closure = { () -> Bool in
            print("-----> Stack trace from inline closure");
            Thread.callStackSymbols.forEach({print($0)});
            return true;
        }
        inlineStackTrace();
        let _ = closure();
        
        DispatchQueue.main.async {
            escClo();
        }
    }
    
    func test2() {
        var clo : [()->()] = []
        var i = 0
        
        for _ in 0..<5 {
            clo.append { [i] in
                print(i)
            }
            i = i+1
        }

        clo[0]()
        clo[1]()
        clo[2]()
        clo[3]()
        clo[4]()
    }
}
