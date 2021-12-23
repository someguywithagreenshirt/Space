//
//  TodoView.swift
//  Space
//
//  Created by Richard Campbell on 12/22/21.
//

import SwiftUI
#warning("Todo list")
// TODO: Top Tasks
// - [X] Get the TestData setup
// - [X] Accept different viewTypes
// - [ ] Make Compact View that will go on timeline (or call it timeline view)
// - [ ] Read Todo info from CoreData
// - [ ] Create models for timeblocking
// - [ ] Get encoders and decoders setup
// - [ ] Turn some of the above and the preview code into snippets
// - [ ] Enum Time in half hour blocks (or should I just Date()?)

struct TodoView: View {
    let viewType: ViewType = .card
    var complete = false
    let title: String = TestData.title
    let description: String = TestData.description
    
    var body: some View {
        switch viewType {
        case .card:
            Card(complete: complete) // temp pass-in for previews
        case .compact:
            Compact()
        case .fullscreen:
            FullScreen()
        }
    }
}

// MARK: Card ViewTYpe
extension TodoView {
    struct Card: View {
        var complete = false
        let title: String = TestData.title
        let description: String = TestData.description
        
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                HStack {
                    Group {
                        if complete {
                            Image(systemName: "checkmark.square")
                            //.padding()
                        } else {
                            Image(systemName: "square")
                            //.padding()
                        }
                    }
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                    //.padding()
                }
                .padding([.top, .leading, .trailing])
                
                VStack {
                    Text(description)
                        .font(.caption)
                    
                    Spacer()
                }
                .frame(minHeight: 200, maxHeight: 300)
                .padding(.all)
                .background(RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.secondary))
                .minimumScaleFactor(0.5)
                
            }
            
            .background(RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.secondary))
        }
    }
}

// MARK: Compact ViewType
extension TodoView {
    struct Compact: View {
        var body: some View {
            EmptyView()
        }
    }
}

// MARK: FullScreen ViewType
extension TodoView {
    struct FullScreen: View {
        var body: some View {
            EmptyView()
        }
    }
}

// MARK: Previews
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoView()
                .namedPreview("Incomplete Card Todo")
            TodoView(complete: true)
                .namedPreview("Complete Card Todo")
        }
    }
}
