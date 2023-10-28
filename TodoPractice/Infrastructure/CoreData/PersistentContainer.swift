//
//  PersistentContainer.swift
//  TodoPractice
//
//  Created by tatsuki_matsumoto on 2023/10/14.
//

import CoreData

class PersistentContainer: NSPersistentContainer {
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) throws {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        try context.save()
    }
}
