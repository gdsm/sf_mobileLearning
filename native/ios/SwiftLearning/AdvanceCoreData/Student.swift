//
//  Student.swift
//  SwiftLearning
//
//  Created by Gagandeep on 10/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import CoreData

@objc(Student)
public class Student: NSManagedObject {
    static let entityName = "Student"

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var klass: Int32

}
