//
//  EnvironmentProperty.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import SwiftUI

struct EnvironmentProperty: View {
    
    @EnvironmentObject var theme: CustomizeTheme
    
    var body: some View {
        HStack() {
            Button(theme.checkingPublish) {
                theme.checkingPublish = "You tapped me."
            }.foregroundColor(.white)
            Spacer()
            Button(theme.checkingPublish) {
                theme.checkingPublish = "Hahaha Other one resets.."
            }.foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: 50)
            .padding(20).background(theme.secondaryColor)
    }
}

struct EnvironmentProperty_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentProperty().environmentObject(CustomizeTheme.defaultTheme())
    }
}
