//
//  SwiftUIView.swift
//  SwiftLearning
//
//  Created by Gagan on 24/09/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI

struct ValidationPreferenceKey : PreferenceKey {
   static var defaultValue: [Bool] = []

   static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
      value += nextValue()
   }
}

struct ValidationModifier : ViewModifier  {
   let validation : () -> Bool
   func body(content: Content) -> some View {
         content
            .preference(
               key: ValidationPreferenceKey.self,
               value: [validation()]
            )
    }
}

extension TextField   {
   func validate(_ flag : @escaping ()-> Bool) -> some View {
      self
         .modifier(ValidationModifier(validation: flag))
   }
}

struct TextFormView<Content : View> : View {
   @State var validationSeeds : [Bool] = []
   @ViewBuilder var content : (( @escaping () -> Bool)) -> Content
   var body: some View {
         content(validate)
         .onPreferenceChange(ValidationPreferenceKey.self) { value in
            validationSeeds = value
         }
   }

   private func validate() -> Bool {
      for seed in validationSeeds {
         if !seed { return false}
      }
      return true
   }
}

struct PreferenceKeyView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyView()
    }
}
