

import UIKit
//import kmmLearning


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var nibViews : [Any]? = [Any]()
//        nibViews?.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)));
//        nibViews?.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)));
//        if let nvs:[UIView] = nibViews as? [UIView]{
//            for view:UIView? in nvs{
//                print("Traversing View : ", view ?? "Nil View");
////                print("Traversing View : ", view);
//            }
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
//        maximumQuality(packets: [5, 2, 2, 1, 5, 3, 2], channels: 2)
//        TestSorting.testScenario_1();
        debug();
//        debugSets();
//        debugKmm()
//        debugSqlDelight()
//        debugObjcThreading()
//        debugAdvanceCoreData()
    }

    
    func maximumQuality(packets: [Int], channels: Int) -> Int {
        // Write your code here
        if packets.count < 1 ||
            packets.count > 5_00_000 ||
            channels < 1 ||
            channels > packets.count {
            return 0
        }
        
        var allChannels: [[Int]] = []
        
        // initialize all channels with empty array
        for i in 0..<channels {
            allChannels.insert([], at: i)
        }
        
        for p in packets {
            var minMedian = 1_000_000_000_000_000
            var selIndex = 0
            
            for (chn_idx, chn_val) in allChannels.enumerated() {
                let med = getMedian(chn_val)
                if minMedian > med {
                    minMedian = med
                    selIndex = chn_idx
                }
            }
                        
            // binary insertion in channel
            var ins_idx = allChannels[selIndex].count
            for (idx, val) in allChannels[selIndex].enumerated() {
                if p > val {
                    ins_idx = idx
                    break
                }
            }
            
            allChannels[selIndex].insert(p, at: ins_idx)
        }
        
        var maxMedian = 0
        for chn in allChannels {
            maxMedian += getMedian(chn)
        }
        return maxMedian
    }
    
    func getMedian(_ input: [Int]) -> Int {
        if input.count <= 0 {
            return 0
        }
        let count = input.count / 2
        if (input.count % 2) == 0 {
            // number of elements are even
            let v1 : Double = Double(input[count-1]) + Double(input[count])/2
            return Int(v1.rounded(.towardZero))
            
        } else {
            return input[count]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func debug(){
//        let constants : Constants = Constants()
//        constants.printAll()
        
//        let td : Tuples_Dictionaries = Tuples_Dictionaries();
//        td.debug();
//        td.reverse_a_tuple();
        
//        let opt : Optionals = Optionals();
//        opt.debug();
        
//        let err : Errors = Errors();
//        err.debug();
        
//        let opt : Operators = Operators();
//        opt.debug();
        
        let str : StringLiterals = StringLiterals();
        str.debug();
        
//        let col : Collection = Collection();
//        col.debugArray();
//        col.debugSets();
//        col.debugDictionaries();
        
//        let clo : Closures = Closures();
//        clo.debugAll();
        
//        let enu : Enumerations = Enumerations();
//        enu.debugAll();
        
//        let sClass : SwiftClass = SwiftClass(param1: "Class Init String", param2: 1234);
//        sClass.printClass();

//        var sStruct : SwiftStruct = SwiftStruct(param1: "Struct Init String", param2: 1234);
//        sStruct.printStructure();
//
//        let quad = Quadilateral();
//        quad.plusOne();

//        let prop : Properties = Properties()
//        prop.debugAll();
        
//        let sMethod = StructureMethods();
//        sMethod.debugAll();
//
//        let cMethod = ClassMethods();
//        cMethod.debugAll();
        
//        let subs : Subscript = Subscript();
//        subs.debugAll();
        
//        let inh = Inheritance();
//        inh.debugAll();
        
//        let ini = Initializer();
//        ini.debugAll()
        
//        let optChan = OptionalChaning();
//        optChan.debugAll();
        
//        let typeCasting = TypeCasting();
//        typeCasting.debugAll();

//        let ext = Extensions();
//        ext.debugAll();

        // will debug later
//        let ms = MemorySafety();
//        ms.debugAll();
        
        
//        let p = Protocol();
//        p.debugAll()

//        let g = Generics();
//        g.debugAll();
        
//        let hof = HighOrderFunction();
//        hof.debugAll();

//        let map = Maps();
//        map.debugAll();
        
//        let fMap = FlatMaps();
//        fMap.debugAll();
        
//        let swiftcore = SwiftCore();
//        swiftcore.debugAll();
        
//        let dispatch = Dispatch();
//        dispatch.debugAll();
        
//        let p = TestPrimeNumers ();
//        p.debugAll()
        
//        let po = Pointers();
//        po.debugAll();
        
//        let dp = DesignPatterns();
//        dp.debugAll();
        
//        let binarygap = BinaryGap();
//        binarygap.debugAll();
        
//        let env = EnvironmentVariable();
//        env.debugAll();
        
//        let objcA = ObjcArrays();
//        objcA.test();
        
//        let ma2 = MemoryLevel2();
//        ma2.debugAll();
        
//        let so = SwiftObjcComm();
//        so.debugAll();
        
//        let r = ReverseInt()
//        r.debug()
        
//        let rsll = ReverseSLL()
//        rsll.debug()
        
//        let objc = ObjcExtnCat()
//        objc.debug()
//
//        let obj = CustomHoF()
//        obj.debug()
//
//        let pw = PropertyWrappers()
//        pw.debug()
    }
    
    func debugSets() {
        let s = SwiftSet()
        s.debug();
    }
    
    func debugKmm() {
//        let v = kmmLearning.HelloKMM()
//        print(v.hello(msg: "Hello from iOS Native"))
    }
    
    func debugSqlDelight() {
//        let helper = DatabaseHelper(databaseFactory: DatabaseDriverFactory())
//        helper.insertCategory(id: 1, name:"ABC")
//        helper.insertCategory(id: 2, name:"DEF")
//        helper.insertDefaultColors()
//        
//        print(helper.getAllCategories())
//        print(helper.getAllColors())
    }
    
    func debugObjcThreading() {
        ObjcThreading.shared().testSynchronisation()
    }
    
    private func debugAdvanceCoreData() {
        UserProfileDatabase.sharedInstance.initialize()
    }
}

