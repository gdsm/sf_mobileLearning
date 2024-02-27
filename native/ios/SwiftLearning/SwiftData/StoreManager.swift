//
//  StoreManager.swift
//  SwiftLearning
//
//  Created by Gagandeep on 10/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
class StoreManager {
    var id: String
    var name: String
    init(id: String, name: String) {
        self.name = name
        self.id = id
    }
}
