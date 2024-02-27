/*
 1. Generics allow flexibility in programming.
 2. Array's and Dictionaries are Generic type.
 3. AnyObject is not equatable
 */

import Foundation



// defning the type constraint on generics. The second template must be Hashable type.
struct Stack<Element, T:Equatable>{
    
    // that;s the basic all elements should be of single type. But interesting question create a highly generic data container.
    var items = [Element]()
    var tItems = [T]()
    
    mutating func push (item : Element){
        items.append(item);
    }
    
    mutating func pop (){
        items.removeLast();
    }
    
    func findElement<T>(valueToFind:T) -> T?{
        for e in tItems{
            // Need to check how this will work
           // if e == valueToFind
//            {
                print("Element Found \(e)");
             //   return e as? T;
//            }
        }
        return nil;
    }
    
    func printStack (){
        for e in items{
            print("Element \(e) of type \(type(of: e))")
        }
    }
}

// extensions also support generics
extension Stack{
    var top : Element?{
        get{
            return items.first
        }
    }
}


// associated type: Declatre in protocol such that its type can be assigned later on.
protocol Container
{
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}



// A complete Example of generics, protocol, extention, struct, class

protocol StringQueueProtocol{
    associatedtype Element;
    mutating func appendElement(e:Element);
    mutating func removeElement();
    
    var count : Int {get};
    
    subscript(i:Int) -> Element {get set}
}

struct StringQueue<T> : StringQueueProtocol{

    typealias Element = String;
    private var queue = [Element]()
    
    var count: Int {
        get{
            return queue.count;
        }
    }
    
    mutating func appendElement(e: Element) {
        queue.append(e);
    }
    
    mutating func removeElement() {
        queue.removeFirst();
    }
    
    subscript(i: Int) -> Element {
        get {
            return queue[i]
        }
        set (newValue) {
            if (self.queue.contains(newValue)){
                self.queue[i] = newValue
            }
            else{
                self.queue.append(newValue)
            }
        }
    }
    

    
    func printQueue (){
        print("------Printing Queue------")
        for e in queue
        {
            print(e);
        }
    }
}

extension StringQueue where T:Equatable{
    
    mutating func appendInt (i : Int){
        let s = String(i);
        self.appendElement(e: s);
    }
    
    mutating func appendDouble (d : Double){
        let s = String(d);
        self.appendElement(e: s);
    }
}

// Build Time error : Associated type can only be defined in protocol.
//class ASContainer{
//    associatedtype Item;
//}


class Generics{
    
    func swapValues<T>(a:inout T, b:inout T) {
        let c:T = a;
        a = b;
        b = c;
    }
    
    // Inheritance from template class iw not allowed.
//    class Template : <T>{
//    
//    }
    
    class Template {
        
        func templateFunc<T,U, V>(p1:T, p2:U, p3:inout V) {
            print("Param p1 type \(type(of: p1))")
            print("Param p2 type \(type(of: p2))")
            print("Param p3 type \(type(of: p3))")
            
            //templace value is force downcasted.
            let i : Template = p3 as! Template;
            print("Pointer address \(Unmanaged.passUnretained(i).toOpaque())");
        }
    }
    
    
    
    
    
    
    ///// Where clause
    
    class WhereClause{
        
        var q1 = StringQueue<String>();
        var q2 = StringQueue<String>();

        private func implementQueues (){
            q1[0] = "Queue 1 : Element 1";
            q1.appendInt(i: 1)
            q1.appendDouble(d: 1.1)
            
            q2[0] = "Queue 2 : Element 1";
            q2.appendInt(i: 2)
            q2.appendDouble(d: 2.2)
        }
        
        /// Hmmmmm now got the clearity : We are playing with generics here. So every thing is depend in type of generics. ..
        // Now explain it:
        // created a generic protocol { protocol StringQueueProtocol } it contains a associated type so it is a generic protocol
        // created a value type (struct) { struct StringQueue : StringQueueProtocol } It follows the protocol so all methods computed properties are defined. Element Type needs to be defined which is string type. NOTE that string follows the equatable protocol in swift.
        // Now below the method Q1, Q2 are templates so method passes the build time criteria if Q1.Element and Q2.Element are of same types which are String (associated types) in this case. second thing here is that Q1.Element should follow equatable property As mentioned above String follows equatable protocol.
        func identicalQueues <Q1 : StringQueueProtocol, Q2 : StringQueueProtocol> (queue1 : Q1, queue2:Q2) -> Bool where Q1.Element == Q2.Element, Q1.Element:Equatable
        {
            if (queue1.count != queue2.count){
                print("Queues are not identical : count mismatch");
                return false;
            }
            
            
            return true;
        }
        
        func testQueue() {
            self.implementQueues();
            q1.printQueue()
            q2.printQueue()
            
            
            let res : Bool = identicalQueues(queue1: q1, queue2: q1);
            if res{
                print("Queues are identical");
            }
        }
    }
    
    
    
    
    
    // Generics with Inheritance
    // Generics cannot be under arthematics 😳😳😳😳😳🤓🧐
    class BaseGenericClass <T> {
        
        final private var baseProp : T?
        
        // final functions cannot be subclassed
        final func assignValue (val : T) {
            baseProp = val;
        }
        
        func checkElementType<E> (param : E){
            print(type(of: param));
        }
        
        final func getValue () -> T? {
            return baseProp;
        }
    }

    // A derived class should tell what kind of generics it is.
    class DerivedGenericClass<U> : BaseGenericClass<U>{

        func testAll (param :U){
            self.assignValue(val: param);
        }
        
        override func checkElementType<E>(param: E) {
            super.checkElementType(param: param)
        }
    }
    
    // only the immediate child class should define the generic type
    class Derived2GenericClass : DerivedGenericClass <Double>{
        func testAll (){
            self.testAll(param: 1.5)
            print("Value \(String(describing: getValue()))")
            
            print("Element Type \(self.checkElementType(param: 1))")
        }
    }
    
    
    
    
    func debugAll () {
        print("----------------------------------")
        var p1 = "Param 1"
        var p2 = "Param 2"
        print ("Param 1 \(p1) : Param 2 \(p2)")
        swapValues(a: &p1, b: &p2)
        print ("Param 1 \(p1) : Param 2 \(p2)")
        
        
        print("----------------------------------")
        var t = Template();
        t.templateFunc(p1: "Hello Template", p2: t, p3:&t);
        
        print("----------------------------------")
        var s = Stack<Any, Int>();
        s.push(item: "String")
        s.push(item: Set<Int>())
        s.push(item: Dictionary<String,String>())
        s.push(item: ("Key","Value"))
        s.printStack();
        print("Top \(String(describing: s.top))");
        
        print("----------------------------------")
        let wc = WhereClause();
        wc.testQueue();


        print("----------------------------------")
        let dgc = Derived2GenericClass();
        dgc.testAll();
    }
    
}
