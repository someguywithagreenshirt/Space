//
//  TodayView.swift
//  Space
//
//  Created by Richard Campbell on 12/25/21.
//

import SwiftUI

struct TodayView: View {
    let todoList = TestData.todoList
    
    var body: some View {
        List {
            ForEach(todoList) { todo in
                HStack {
                    Image(systemName: "square")
                    Text(todo.title)
                }
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
