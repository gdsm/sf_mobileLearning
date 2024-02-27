//
//  BindingProperty.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI

struct BindingProperty: View {
    
    @State private var counter = 0
    
    var body: some View {
        HStack() {
            Text("Counter value \(counter)")
            ChildView(counter: $counter)
        }.frame(maxWidth: .infinity, maxHeight: 50)
    }
}

struct BindingProperty_Previews: PreviewProvider {
    static var previews: some View {
        BindingProperty()
    }
}


struct ChildView: View {
    @Binding var counter: Int
    
    var body: some View {
        HStack() {
            Button("++") {
                counter += 2
            }
            Button("--") {
                counter -= 2
            }
        }
    }
}
