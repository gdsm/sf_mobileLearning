//
//  BasicView.swift
//  SwiftLearning
//
//  Created by Gagan on 28/11/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

import SwiftUI


struct BasicView: View {
    @State var red: Double = 0.5
    @State var green: Double = 0.5
    @State var blue: Double = 0.5
    
    init(_ red: Double, _ green: Double, _ blue: Double) {
        _red = State(initialValue: red)
        _green = State(initialValue: green)
        _blue = State(initialValue: blue)
    }
    
    var callbackColor: ((Double, Double, Double) -> Void)?
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10, content: {
            Text("Enter colors !!")
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            VStack {
                Rectangle().foregroundColor(Color(.sRGB, red: getRed().wrappedValue, green: getGreen().wrappedValue, blue: getBlue().wrappedValue, opacity: 1.0))

                VStack {
                    HStack {
                        Circle().foregroundColor(Color(.sRGB, red: getRed().wrappedValue, green: 0.0, blue: 0.0, opacity: 1.0)).frame(width: 50, height: 50, alignment: .leading).padding()
                        Slider(value: Binding(get: {
                            return self.red
                        }, set: { (newValue) in
                            self.red = newValue
                            self.callbackColor?(self.red, self.green, self.blue)
                        }), in: 0.0...1.0,
                               label: {Text("")},
                               minimumValueLabel: {Text("0")},
                               maximumValueLabel: {Text("1")})
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            
                    }
                    HStack {
                        Circle().foregroundColor(Color(.sRGB, red: 0.0, green: getGreen().wrappedValue, blue: 0.0, opacity: 1.0)).frame(width: 50, height: 50, alignment: .leading).padding()
                        Stepper("Green", value: Binding(get: {
                            return self.green
                        }, set:{ (newValue) in
                            self.green = newValue
                            self.callbackColor?(self.red, self.green, self.blue)
                        }) ,in: 0.0...1.0, step: 0.05).padding()
                    }
                    HStack {
                        Circle().foregroundColor(Color(.sRGB, red: 0.0, green: 0.0, blue: getBlue().wrappedValue, opacity: 1.0)).frame(width: 50, height: 50, alignment: .leading).padding()
                        
                        Slider(value: Binding(get: {
                            return self.blue
                        }, set: { (newValue) in
                            self.blue = newValue
                            self.callbackColor?(self.red, self.green, self.blue)
                        }), in: 0.0...1.0,
                               label: {Text("")},
                               minimumValueLabel: {Text("0")},
                               maximumValueLabel: {Text("1")}).padding()
                    }
                }
            }
        })
    }
    
    private func getRed() -> Binding<Double> {
        return Binding.constant(red)
    }
    private func getGreen() -> Binding<Double> {
        return Binding.constant(green)
    }
    private func getBlue() -> Binding<Double> {
        return Binding.constant(blue)
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView(1.0, 0.5, 0.5)
    }
}
