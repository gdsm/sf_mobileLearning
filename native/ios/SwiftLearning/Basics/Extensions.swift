/*
 1. Extension decleration is onlt valid in file scope not inside class.
 2. It is only to extend the existing functionality not to add new functionality.
 3. Cannot add new stored properties but calculated properties can be added.
 4. Extensions can be of classes or structures.
 */

import Foundation

class Object{
    var classProperty = "Class Property";
    
    func printAll (){
        print("classProperty \(classProperty)")
        print("Extension property fromclass \(extProperty)");
    }
}

// extensions can be private / file private
fileprivate extension Object{
//    var property = "Extension property" // build time error:
    var extProperty : String {
        get{
            return "Extension Property"
        }
    }
    
    subscript (index : Int) -> String {
        get{
            if (index == 0){
                return classProperty;
            }
            else{
                return extProperty;
            }
        }
    }
    
    convenience init (extparam : String){
        self.init();
        // designates initializer cannot be added in extension
        // similarly designated deinitializer cannot be added in extension.
    }
    
    func printExtension (){
        print("Class prop from extension : \(classProperty)")
        print("extProperty \(extProperty)")
    }
}




struct SObject {
    var structProperty = "Structure property"
    func modifyPropertyInStruct (prop : String) {
//        structProperty = prop; // cannot modify property becasue self is immutable here.
    }
    
    
    func printAll (){
        print (structProperty);
    }
}

extension SObject{
    
    mutating func modifyPropertyInExtension (prop : String){
        structProperty = prop; // cannot modify property becasue self is immutable here.
    }
}


class Extensions{

    func debugAll (){
        let obj = Object(extparam: "Conveninence initialization");
        print("\(obj.printAll())")
        print("\(obj.printExtension())")
        print("Subscript in extension \(obj[0])")
        print("Subscript in extension \(obj[1])")
        
        
        let sObj = SObject();
        sObj.modifyPropertyInStruct(prop: "Modify structure priperty in extension")
        sObj.printAll();
    }
}
