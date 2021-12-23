//
//  Todo+CoreDataHelpers.swift
//  Space
//
//  Created by Richard Campbell on 12/20/21.
//

import Foundation

extension Todo {
    var title: String {
        cd_title ?? ""
    }
    
    var desc: String {
        cd_description ?? ""
    }
    
    var completed: Bool {
        cd_completed
    }
    
    static var exampleTodo: Todo {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let todo = Todo(context: viewContext)
        todo.cd_title = "Example Todo"
        todo.cd_description = "This is an example todo"
        todo.cd_completed = false
        return todo
    }
    
}
