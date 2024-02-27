//
//  StateProperty.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI

struct StateProperty: View {
    
    @EnvironmentObject var theme: CustomizeTheme
    @State var counter: Int = 0
    @State var isPresented = false
    
    var body: some View {
        VStack() {
            Text("State Property Counter : \(counter)")
            Button("+") {
                counter += 1
            }
            .foregroundColor(.red)
            Button("-") {
                counter -= 1
                isPresented = true
            }
            .foregroundColor(.red)

        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(theme.secondaryColor)
    }
}

struct StateProperty_Previews: PreviewProvider {
    static var previews: some View {
        StateProperty()
            .environmentObject(CustomizeTheme.defaultTheme())
    }
}
