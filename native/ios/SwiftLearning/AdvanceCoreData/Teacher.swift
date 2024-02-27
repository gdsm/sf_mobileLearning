//
//  Teacher.swift
//  SwiftLearning
//
//  Created by Gagandeep on 10/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import CoreData

@objc(Teacher)
public class Teacher: NSManagedObject {
    static let entityName = "Teacher"

    @NSManaged public var id: String
    @NSManaged public var name: String

}
