
import Foundation


enum Log_Tag: String{
    case Info = "Info"
    case Error = "Error"
    case Debug = "Debug"
}

//---> Logging
func Log(tag: Log_Tag, msg: String) {
    print("\(tag.rawValue) : \(msg)");
}


//MARK: Nodes
class BaseNode<NODETYPE> {
    var value: NODETYPE;
    var level: Int = 0;
    init(_ value: NODETYPE, level: Int) {
        self.value = value;
        self.level = level;
    }
}
class HeapNode<NODETYPE>: BaseNode<NODETYPE> {
    private var leftChilds: [HeapNode] = [];
    private var rightChilds: [HeapNode] = [];
    
    func addChild(_ value: NODETYPE) -> Bool {
        if ((self.leftChilds.count > 0) && (self.rightChilds.count > 0)) {
            Log(tag: .Error, msg: "Insertion node should have empty leaf");
            return false;
        }
        let node = HeapNode(value, level: self.level+1);
        (self.leftChilds.count <= 0) ? self.leftChilds.append(node) : self.rightChilds.append(node);
        return true;
    }

    func leafNodes() -> [HeapNode] {
        if self.isLeafNode() {
            return [self];
        }
        var allLeafs: [HeapNode] = [];
        for child in self.leftChilds {
            allLeafs = allLeafs + child.leafNodes();
        }
        for child in self.rightChilds {
            allLeafs = allLeafs + child.leafNodes();
        }
        
        return allLeafs;
    }
    
    func minLevelLeafNode() -> HeapNode{
        let leafNodes = self.leafNodes();
        let retVal :HeapNode = leafNodes.min(by: {
            return ($0.level < $1.level);
        })!
        return retVal;
    }
    
    func preorderTraversal() {
        Log(tag: .Info, msg: "{Level:\(self.level)} , {Node:\(self.value)}");
        
        if self.leftChilds.count > 0 {
            Log(tag: .Info, msg: "Traversing left child");
            for child in self.leftChilds {
                child.preorderTraversal();
            }
        }

        if self.rightChilds.count > 0 {
            Log(tag: .Info, msg: "Traversing right child");
            for child in self.rightChilds {
                child.preorderTraversal();
            }
        }
    }
    
    
    
    
    //MARK: Private methods
    private func isLeafNode() -> Bool {
        return self.isCompleteLeafNode() || self.isPartialLeafNode();
    }
    private func isCompleteLeafNode() -> Bool{
        return (leftChilds.count == 0) && (rightChilds.count == 0);
    }
    private func isPartialLeafNode() -> Bool{
        return (leftChilds.count == 0) || (rightChilds.count == 0);
    }
}




//MARK: Protocol
protocol SortingProtocol {
    associatedtype ElementType
    func add(element: ElementType);
    func printTree();
}

//MARK: Sorting Algo
class HeapSort<Type>: SortingProtocol {
    typealias ElementType = Type
    private var rootNode: HeapNode<Type>;

    init (withRoot: Type) {
        self.rootNode = HeapNode(withRoot, level: 0);
    }

    //MARK: Protocol Methods
    func add(element: Type) {
        let leafNode = self.rootNode.minLevelLeafNode();
        if !leafNode.addChild(element) {
            Log(tag : .Error, msg: "Error in inserting node \(element)");
        }
    }
    
    func printTree(){
        self.rootNode.preorderTraversal();
    }
}


//MARK: Testing
class TestSorting {
    static func testScenario_1() {
        Log(tag: .Info, msg: "Testing int scenario")

        let heapSort = HeapSort(withRoot: 50);
        heapSort.add(element: 20);
        
        
        heapSort.printTree();
    }
}

//TestSorting.testScenario_1();
