//
//  Redux-Shop.swift
//  SwiftLearning
//
//  Created by Gagandeep on 18/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

/**
 Redux Patter is to seperate out State management from UI. Redux Pattern is made possible with SwiftUI. Its advantages are seperation of concerns.
 If there is a deep dive binary tree heirarchy of Views and 2 childerens on seperate branch needs to update UI. With traditional approach all parent needs to re-render.
 But with ReDux approach state management can be seperated out.
 
 Redux has 3 parts:
 - Store : Shop
 - Action : BUY_CAKE
 - Reducer: Complete action
 
 
 
 😅😅😅😅😅 : it's not too much wort explicit working in redux. PreferenceKey is already there to broadcast infomation to other UIs
 
 */

import Foundation
import SwiftUI


enum DimenAction {
    case area(x: Int, y: Int)
    case volume(x: Int, y: Int, z: Int)
}

class Dimension: ObservableObject {
    @Published private(set) var area: Int
    @Published private(set) var volume: Int
    @Published private(set) var reducer: Reducer
    
    private init(area: Int, volume: Int, reducer: @escaping Reducer) {
        self.area = area
        self.volume = volume
        self.reducer = reducer
    }
    
    convenience init(area: Int, reducer: @escaping Reducer) {
        self.init(area: area, volume: 0, reducer: reducer)
    }
    
    convenience init(volume: Int, reducer: @escaping Reducer) {
        self.init(area: 0, volume: volume, reducer: reducer)
    }
}

typealias Reducer = (Dimension, DimenAction) -> Dimension

let reducer: Reducer = { (dimension, action) -> Dimension in
    switch action {
        case .area(let x, let y):
        return Dimension(area: x * y, reducer: dimension.reducer)
        case .volume(let x, let y, let z):
        return Dimension(volume: x * y * z, reducer: dimension.reducer)
    }
}


struct ShapeCalculator: View {
    
    @State var x: String = "0"
    @State var y: String = "0"
    @State var z: String = "0"
    
    var body: some View {
        VStack {
            HStack {
                TextField("X", text: $x)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)

                TextField("Y", text: $y)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)

                TextField("Z", text: $z)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
            }
            HStack {
                Button("Calculate Area") {
                    print("Calculate Area tapped")
                    
                }
                .background(Color.green)
                .foregroundColor(.white)
                Button("Calculate Volume") {
                    print("Calculate Volume tapped")
                }
                .background(Color.black)
                .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            AreaCalculator().environmentObject(Dimension(area: 0, reducer: reducer))
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            VolumeCalculator().environmentObject(Dimension(volume: 0, reducer: reducer))
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

struct ShapeCalculator_Preview: PreviewProvider {
    static var previews: some View {
        ShapeCalculator()
    }
}


struct AreaCalculator: View {
    
    @EnvironmentObject var dimen: Dimension
    var body: some View {
        HStack {
            Text("Area = \(dimen.area)")
        }.background(Color.red)
    }
}

struct VolumeCalculator: View {
    
    @EnvironmentObject var dimen: Dimension
    var body: some View {
        HStack {
            Text("Volume = \(dimen.volume)")
        }.background(Color.blue)
    }
}
