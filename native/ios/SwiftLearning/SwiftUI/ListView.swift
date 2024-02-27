//
//  ListView.swift
//  SwiftLearning
//
//  Created by Gagan on 31/12/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var selectedEmpCallback: ((Employee?) -> Void)!
    @State var selectedEmp: Employee?
    var employees: [Employee]
    
    var body: some View {
        NavigationView {
            List(employees, id: \.id, selection: Binding(get: {
                return self.selectedEmp
            }, set: { newValue in
                selectedEmpCallback(newValue)
            })) { emp in
                Button(action: {
                    selectedEmpCallback(emp)
                }, label: {
                    ListViewRow(employee: emp)
                })
            }
            .navigationTitle("Employees")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(employees: [Employee(id: 1, name: "A", age: 1, experience: 1.1)])
    }
}
