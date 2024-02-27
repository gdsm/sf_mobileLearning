//
//  HostingController.swift
//  SwiftLearning
//
//  Created by Gagan on 28/11/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


class SwiftUIViewController : UITableViewController {
    
    var basicView : BasicView!
    var listView : ListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    //MARK: UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row
        {
        case 0:
            // Basic View
            basicView = BasicView(0.5, 0.1, 0.5)
            basicView.callbackColor = { (red, green, blue) -> Void in
                print("Red : \(red)")
                print("Green : \(green)")
                print("Blue : \(blue)")
            }
            
            let hostingController = UIHostingController(rootView: basicView)
            self.present(hostingController, animated: true, completion: nil)

        case 1:
            let employees = [Employee(id: 0, name: "John", age: 25, experience: 3.3),
                             Employee(id: 1, name: "Smith", age: 35, experience: 10.9)]
            listView = ListView(employees: employees)
            listView.selectedEmpCallback = { (sEmp) -> Void in
                print("Selected employee \(String(describing: sEmp))")
            }
            let hostingController = UIHostingController(rootView: listView)
            self.present(hostingController, animated: true, completion: nil)
            
        case 2:
            let hostingController = UIHostingController(rootView: OnlyView())
            addChild(hostingController)
            
            let v = hostingController.view
            v?.frame  = CGRect(x: 0, y: 0, width: 100, height: 100)
            view.addSubview(v!)

        case 3:
            let hostingController = UIHostingController(rootView: UIKit_In_SwiftUI())

            self.present(hostingController, animated: true, completion: nil)

        case 4:
            let hostingController = UIHostingController(rootView: PropertyWrapperView())

            self.present(hostingController, animated: true, completion: nil)

        case 5:
            AsyncProgramming.sharedInstance.initialize()
            
        case 6:
            KeychainManager.sharedInstance.debug()

        default:
            print("Unknown swift UI")
        }
    }
    
}
