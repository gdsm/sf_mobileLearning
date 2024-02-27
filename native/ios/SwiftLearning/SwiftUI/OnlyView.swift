//
//  OnlyView.swift
//  SwiftLearning
//
//  Created by Gagan on 03/01/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

import SwiftUI


struct OnlyView: View {
    var body: some View {
        VStack {
            Text("Leve 1")
            Text("Leve 2")
            Text("Leve 3")
        }
        .background(Color.red)
    }
}

struct OnlyView_Previews: PreviewProvider {
    static var previews: some View {
        OnlyView()
    }
}
