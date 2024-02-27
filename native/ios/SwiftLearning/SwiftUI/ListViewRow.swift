//
//  ListViewRow.swift
//  SwiftLearning
//
//  Created by Gagan on 31/12/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

import SwiftUI

struct ListViewRow: View {
    
    var employee: Employee
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name : \(employee.name)")
            Text("Age : \(employee.age)")
            Text("Exp : \(String(format: "0.2", employee.experience))")
        }
    }
}

struct ListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ListViewRow(employee: Employee(id: 0, name: "Sample Employee", age: 30, experience: 4.4)).previewLayout(.fixed(width: 300, height: 70))
    }
}
