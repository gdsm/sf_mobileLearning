/*
 1. Initializers are used to initialize instance. Initializers in swift are not like Objective C. Which means that the Class Instances or variable instances are not inisitalized with variables, instead they ake sure that every thing is setup perfectly to load the value when instance is used.
 2. Similarly there are de-initializers which ensures that the instances are cleaned up perfectly.
 3. A stored properties must be initialized wheather in structure or in classes.
 */

import Foundation


class QuestionableInSwift{
    
    // Swift initializer stated that creating instance and loading variable in memory are 2 different things, a variable is not loaded in memory untill it is required. But the following class variable instance is created at what time????? If we touch the property in init that would be loaded in memory.
    // I think the answer to this is : a class instance by default follows lazy memoy loading but for properties there is explicit lazy keyword so for the class variables it is a simultaneous process.
    var prop:Int = 0;
    
    init (){
        
    }
}

class Initializer{
    
    
    class PropertyObserver{
        
        let optProp : String;
        var prop : String {
            willSet{
                print("Will set of property is called")
            }
            didSet{
                print("Did set of property is called")
            }
        }

        init (){
            //property observers(willSet, didSet) are not called. because the property is initialized in initializer.
            optProp = "Optional property can be set in initializer but can't be done by subclass."
            prop = "Setting property";
        }
        
        func printAll(){
            //prop = "Property accessed from outside initializer so the init is called."
            print(prop);
        }
    }
    
    
    class OptionalProperty{
        var p1 : String = "";
        // no need to specify the value for optional property because it is by default assumed to be nil (Swift nil means not a value)
        var p2 : String?
        
    }
    
    
    
    
    // Two step initialisation with convenience
    // convenience init can call designated init not the super class convenience init.
//    Basically provides a two step initialisation for a class.
    enum TransisterType{
        case PNP, NPN
    }
    
    struct Silicon{
        var atomicNumber : Int = 84;
//        init (){
//            print("Designated initializer for diode");
//        }
//        Build time error : Concenience initializer are not used in structures.
//        convenience init (){
//        }
    }
    
    class Transister{
        
        private var silica : Silicon;
        
        init (){
            
            print("Designated initializer for Transister");
            silica = Silicon(atomicNumber: 50);
        }
        
        deinit {
            print("De init for Transister");
        }
        
        convenience init (param : Int){
            self.init();
//            super.init();// cannot called super.
            print("convenience initializer for transister")
            
            // cannot to assignation for let properties
            silica = Silicon(atomicNumber: param);
        }
        
        func printAll (){
            print("Silica \(silica.atomicNumber)");
        }
    }
    
    class JFETTransister : Transister{
        override init (){
            super.init();
            print("Designated initializer for JFETTransister");
        }
        
        convenience init (param : String){
            self.init();
            print("convenience initializer for JFETTransister")
        }

        deinit {
            print("De init for JFETTransister");
        }
    }
    
    class Mosfet : JFETTransister{
        override init (){
            print("Designated initializer for Mosfet");
        }
        
        deinit {
            print("De init for Mosfet");
        }

        convenience init (param : String){
            self.init();
            print("convenience initializer for Mosfet")
        }
    }
    
    
    
    
    // Failable initializer
    // non-failable and failable init cannot have same params
    // no failable de-init
    // failable initializer can also propogate to super classes.
    // enumerations can also be failable.
    class FailableInit{
        init(){
            
        }
        init?(param : String?){
            if (param == nil){
                return nil;
            }
        }
        
        convenience init?(p1:String?, p2:String){
            self.init(param: p2)
        }
        
        func printAll(){
            print("Printing Failable init");
        }
    }
    
    
    func debugAll(){
        let po = PropertyObserver();
        po.printAll();
        
        
        let mo = Mosfet();
        mo.printAll();
        
        
        let fi : FailableInit? = FailableInit(p1:nil, p2:"😝")
        fi?.printAll();
    }
}
