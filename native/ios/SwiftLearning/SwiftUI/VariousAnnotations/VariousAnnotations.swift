//
//  VariousAnnotations.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI

/**
 * ObservableObject :
 * - Required for classes to be used in swiftUI. Like EnvironmentObejct.
 * - Must be from class.
 *
 *
 * Published:
 * - used to notify, data is changed , swiftUI needs to udpate its View.
 *
 * EnvironmentObject
 * - Used for global access.
 * - Can be passed across views
 *
 * Binding
 * - Used to pass value from child to Parent.
 *
 * ObservedObject and StateObject
 * - Both are used in conjunction.
 * - Both need a Concrete class follows ObservableObject.
 * - Minor difference, StateObject preserved data across reloads. ObservedObject clears data. ObservedObject is used to pass data from outside View.
 */

struct PropertyWrapperView: View {
    
    var theme: CustomizeTheme = CustomizeTheme.defaultTheme()
        
    var body: some View {
        return VStack() {
            StateProperty()
            EnvironmentProperty()
            BindingProperty()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.backgroundColor)
        .environmentObject(theme)
    }
}

struct Preview_PropertyWrapperView: PreviewProvider {
    static var previews: some View {
        PropertyWrapperView()
            .environmentObject(CustomizeTheme.defaultTheme())
    }
}
