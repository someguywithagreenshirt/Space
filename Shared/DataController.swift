//
//  DataController.swift
//  Space
//
//  Created by Richard Campbell on 12/20/21.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Model")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        
        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }
        
        return dataController
    }()
    
    func createSampleData() throws {
        let viewContext = container.viewContext
        let todo = Todo(context: viewContext)
        
        todo.cd_completed = false
        todo.cd_title = "Go to grocery store"
        todo.cd_description = "Don't forget the milk."
        
        try viewContext.save()
    }
    
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
//    func deleteAll() {
//        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = Item.fetchRequest()
//        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
//        _ = try? container.viewContext.execute(batchDeleteRequest1)
//
//        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Project.fetchRequest()
//        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
//        _ = try? container.viewContext.execute(batchDeleteRequest2)
//    }
    
}
