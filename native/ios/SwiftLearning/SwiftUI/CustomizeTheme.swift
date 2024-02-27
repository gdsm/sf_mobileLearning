//
//  CustomizeTheme.swift
//  SwiftLearning
//
//  Created by Gagan on 27/12/23.
//  Copyright © 2023 Gagan. All rights reserved.
//

import UIKit
import SwiftUI


class CustomizeTheme: ObservableObject {
    
    @Published var backgroundColor = Color.gray
    @Published var secondaryColor = Color.blue
    
    @Published var checkingPublish = "Checking publish on environment class"
    
    
    static func defaultTheme() -> CustomizeTheme {
        return CustomizeTheme()
    }
}
