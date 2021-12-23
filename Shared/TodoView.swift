//
//  TodoView.swift
//  Space
//
//  Created by Richard Campbell on 12/22/21.
//

import SwiftUI

struct TodoView: View {
    let viewType: ViewType = .card
    let title: String = "Title of todo"
    let description: String =
    """
    This is what this todo is all about
    
    And now it is even longer and let's see if this effects it and in what ways.
    """
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
            Text(description)
                .minimumScaleFactor(100)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25).foregroundColor(.secondary))
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
