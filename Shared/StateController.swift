//
//  StateController.swift
//  Space
//
//  Created by Richard Campbell on 12/25/21.
//

import Foundation
import UIKit

class StateController: ObservableObject {
    @Published private(set) var todoList = TestData.todoList
    
    private let storageController = StorageController()
    
    init() {
        
    }
}
    //@Published private(set) var mainUser: User = TestData.user
    
    //@Published var theme: Theme = .default
    //@Published var tags: [Tag] = []
    //@Published var users: [User] = []
    
    //@Published var topQuestions: [Question] {
    //    didSet { storageController.save(topQuestions: topQuestions) }
    //}
    
    //subscript(questionID: Int) -> Question {
    //    get { topQuestions[index(for: questionID)] }
    //    set { topQuestions[index(for: questionID)] = newValue }
    //}
    
    
        
    //init() {
        //topQuestions = storageController.fetchTopQuestions() ?? []
        //mainUser = storageController.fetchUser() ?? TestData.user
    //}
    
    //func save(name: String, aboutMe: String, avatar: UIImage) {
    //    mainUser.name = name
    //    mainUser.aboutMe = aboutMe
    //    mainUser.avatar = avatar
    //    storageController.save(user: mainUser)
    //}
//}

//private extension StateController {
//    func index(for questionID: Int) -> Int {
//        topQuestions.firstIndex(where: { $0.id == questionID })!
//    }
//}
