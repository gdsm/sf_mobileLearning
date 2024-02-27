//
//  UserProfileDatabase.swift
//  SwiftLearning
//
//  Created by Gagandeep on 04/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import CoreData


/* 
 Advance topic is still pending.
 - Porting CoreData to SqlDelight
 - Writing store procedure on CoreData.
 - SwiftData Learning.
 */
class UserProfileDatabase {
    
    static let sharedInstance = UserProfileDatabase()
    private let dbName = "UserProfileDatabase"
    private let latestDbName = "/UserProfileDatabase_2."
    private let dbType = "momd"
    private let versionExtn = "mom"

    private var persistanceStoreContainer: NSPersistentContainer?
    lazy var mainMoC: NSManagedObjectContext? = {
        return self.persistanceStoreContainer?.viewContext
    }()
    
    private init() {
        
    }
    
    func initialize() {
        initializePersistanceStore()
        
        addTeacher(id: "1", name: "T1")
        addStudent(id: "1", name: "S1", klass: 6)
    }
    
    private func initializePersistanceStore() {
        guard let path = Bundle.main.path(forResource: dbName, ofType: dbType) else {
            print("Unable to form path for \(dbName) and \(dbType)")
            return
        }
        let vPath = path + latestDbName + versionExtn
        guard let url = URL(string: vPath) else {
            print("Unable to form url for \(dbName) and \(dbType)")
            return
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            print("Unable to form mom for \(dbName) and \(dbType)")
            return
        }

        persistanceStoreContainer = NSPersistentContainer(name: "UserProfile", managedObjectModel: model)
        
        let destPath: URL!
        do {
            destPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("UserDatabase")
        } catch (let e) {
            print("Failed to read document directory.")
            return
        }

//        // Light weight migration.
//        let description = NSPersistentStoreDescription()
//        description.shouldMigrateStoreAutomatically = true
//        description.shouldInferMappingModelAutomatically = true
//        description.url = destPath
//        persistanceStoreContainer?.persistentStoreDescriptions = [description]

        // Heavy weight migration.
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = false
        description.url = destPath
        persistanceStoreContainer?.persistentStoreDescriptions = [description]

        persistanceStoreContainer?.loadPersistentStores { storeDescription, error in
            if let e = error {
                print("error in loading persistance store \(e)")
            } else {
                print("Loaded persistance store \(storeDescription)")
            }
        }
    }
    
    /// MARK: CRUD for teacher
    func addTeacher(id: String, name: String) {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return
        }
        guard let entity = NSEntityDescription.entity(forEntityName: Teacher.entityName, in: moc) else {
            print("Unable to create entity teacher.")
            return
        }
        
        if (readTeacher(id: id) != nil) {
            print("Teacher with id \(id) already exists deleting old entity.")
            deleteTeacher(id: id)
        }

        let teacher = NSManagedObject(entity: entity, insertInto: moc) as? Teacher
        teacher?.id = id
        teacher?.name = name
        savemoc()
        
        guard let readTeacher = readTeacher(id: id) else {
            print("Failed to read recently inserted teacher object \(id), \(name)")
            return
        }
        
        print("Successfully inserted teacher object \(readTeacher.id), \(readTeacher.name)")
    }
    
    func deleteTeacher(id: String) {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return
        }
        
        guard let teacher = readTeacher(id: id) else {
            print("No entity found for id \(id)")
            return
        }
        moc.delete(teacher)
    }
    
    func readTeacher(id: String) -> Teacher? {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return nil
        }
        let request = NSFetchRequest<NSManagedObject>(entityName: Teacher.entityName)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id==%@", id)
        
        do {
            guard let results = try moc.fetch(request) as? [Teacher] else {
                print("No teacher found for id \(id)")
                return nil
            }
            
            return results.first
        } catch (let e) {
            print("Failed to read Teacher \(id) : \(e)")
        }
        return nil
    }
    
    /// MARK: CRUD for student
    func addStudent(id: String, name: String, klass: Int32) {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return
        }
        guard let entity = NSEntityDescription.entity(forEntityName: Student.entityName, in: moc) else {
            print("Unable to create entity Student.")
            return
        }
        
        if (readStudent(id: id) != nil) {
            print("Student with id \(id) already exists deleting old entity.")
            deleteStudent(id: id)
        }

        let student = NSManagedObject(entity: entity, insertInto: moc) as? Student
        student?.id = id
        student?.name = name
        student?.klass = klass
        savemoc()
        
        guard let readStudent = readStudent(id: id) else {
            print("Failed to read recently inserted student object \(id), \(name)")
            return
        }
        
        print("Successfully inserted student object \(readStudent.id), \(readStudent.name), \(readStudent.klass)")
    }
    
    func deleteStudent(id: String) {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return
        }
        
        guard let teacher = readTeacher(id: id) else {
            print("No entity found for id \(id)")
            return
        }
        moc.delete(teacher)
    }
    
    func readStudent(id: String) -> Student? {
        guard let moc = self.mainMoC else {
            print("Main MOC is null. Cannot proceed.")
            return nil
        }
        let request = NSFetchRequest<NSManagedObject>(entityName: Student.entityName)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id==%@", id)
        
        do {
            guard let results = try moc.fetch(request) as? [Student] else {
                print("No student found for id \(id)")
                return nil
            }
            
            return results.first
        } catch (let e) {
            print("Failed to read Student \(id) : \(e)")
        }
        return nil
    }
    
    private func migrate(srcVersion: String, dstVersion: String) {
        
    }
    
    private func savemoc() {
        do {
            try self.mainMoC?.save()
        } catch (let e) {
            print("Failed to save moc \(e)")
        }
    }
}
