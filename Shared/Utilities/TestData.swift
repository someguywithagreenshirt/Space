//
//  TestData.swift
//  Space
//
//  Created by Richard Campbell on 12/23/21.
//

import Foundation
import SwiftUI

struct TestData {
    static var title = "Todo Title"
    static var description =
        """
        This is what this todo is all about, and how long is this?
        
        And now it is even longer and let's see if this effects it and in what ways.
        """
    static var todo1 = Models.Todo(title: title, description: description)
    static var todo2 = Models.Todo(title: title, description: description)
    static var todo3 = Models.Todo(title: title, description: description)
    static var todo4 = Models.Todo(title: title, description: description)
    static var todo5 = Models.Todo(title: title, description: description)
    static var todoList: [Models.Todo] = [todo1, todo2, todo3, todo4, todo5]
    
    //static let testBlock = IndividualBlock(blockHeight: 73.444444444444442)
    static let testBlock = IndividualBlock(blockWidth: 200, blockHeight: 54.33333333333)
    
    static let realityLine: [IndividualBlock?] = [
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock,
        testBlock
    ]
}
