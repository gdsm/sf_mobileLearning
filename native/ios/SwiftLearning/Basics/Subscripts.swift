/*
 1. Shorcut to access elements. Usefull when you need to drill down to some inner classes. No need to expose them publically.
 2. Subscripts are primarily used for dictionaries. Set/Get dictionary values using subscripts return optional values.
 3. Subscripts are purely depend on you appraoch, you can access whatever you want from a class. May be you can write some of your design pattern.
 4. A subscript should have a return statement, because it is supposed to return something, otherwise it would be similar to function call.
 */

import Foundation


class Subscript{
    
    class Circle {
        var radius : Double = 1;
        var ecentricity : Double = 0.5;
        private let pie : Double = 3.14;
        subscript (rad : Double) -> Double {
            // a computed subscript.
            get{
                print("Getting Subscript in class")
                return (2 * pie * rad);
            }
            set (newRad){
                print("Setting Subscript in class")
                radius = newRad;
            }
        }
        
        subscript (rad:Double, ec : Double) -> Double{
            // A stored subscript
            get{
                print("Getting Subscript in class")
                // forgive me for my bad mathematics. Currently we are in context of understanding subscript. When we are in context of DSP then we will focus in that. 😎😎
                return (2 * pie * rad * ecentricity);
            }
        }

        // A Single param subscript can only be used one. 2-Subscripts should be different from each other.
//        subscript (ec : Double) -> Double{
//            // A stored subscript
//            get{
//                print("Getting Subscript in class")
//                // forgive me for my bad mathematics. Currently we are in context of understanding subscript. When we are in context of DSP then we will focus in that. 😎😎
//                return (2 * pie * ec * ecentricity);
//            }
//        }

        func printAll(){
            print("radius : \(radius)");
        }
    }
    
    struct Rectangle {
        var length : Double
        var width : Double
        
        subscript(l:Double, w:Double) -> Double{
            get{
                print("Getting Subscript in structure")
                return (l * w);
            }
            // Subscript cannot be used for setting multiple values. Build time error
//            set ({newW, newL}){
//                print("Setting Subscript in structure")
//                width = newW
//                length = newL
//            }
        }

        func printAll(){
            print("Length : \(length)");
            print("Width : \(width)");
        }
    }
    
    
    func debugAll(){
        let c : Circle = Circle();
        c.printAll();
        print("Circle Area \(c[2])")
        print("Circle Area \(c[2, 0.8])")
        c.printAll();

        // a 2-d subscript
        let r : Rectangle = Rectangle(length:4, width:2);
        print("RectangleArea : \(r[2,3])")
    }
    
}
