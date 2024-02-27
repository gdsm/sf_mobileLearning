//
//  ObservedAndStateProperty.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI


class SomeObservableObject: ObservableObject {
    @Published var value: Int = 0
}

struct ObservedAndStateProperty: View {
    
    @ObservedObject private var o = SomeObservableObject()
    @StateObject private var s = SomeObservableObject()

    var body: some View {
        VStack() {
            Text("Observable = \(o.value) : State = \(s.value)")
            Button("Observed Object") {
                o.value += 1
            }
            Button("State Object") {
                s.value += 1
            }
            Button("Clear") {
                o.value = 0
                s.value = 0
            }
        }.frame(width: .infinity, height: 100)
    }
}

struct ObservedAndStateProperty_Previews: PreviewProvider {
    static var previews: some View {
        ObservedAndStateProperty()
    }
}
