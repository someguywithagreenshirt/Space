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
// - [X] Make Compact View that will go on timeline (or call it timeline view)
// - [ ] Import BMS round only certain sides object
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
        case .timeline:
            Timeline()
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
                .frame(minWidth: 200, minHeight: 200, maxHeight: 300)
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
fileprivate typealias Timeline = TodoView.Timeline
extension TodoView {
    struct Timeline: View {
        var complete = false
        let title: String = TestData.title
        let description: String = TestData.description
        
        var body: some View {
            
            VStack (alignment: .leading){
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
                        .font(.headline)
                }
                .padding([.top, .leading, .trailing], 5)
                Text(description)
                    .font(.caption)
                    .padding([.leading, .bottom, .trailing], 5)
            }
            
            .frame(width: 250, height: 100, alignment: .leading)
            .background(Color.secondary)
            .cornerRadius(25, corners: .topRight)
            .cornerRadius(25, corners: .bottomRight)
            .minimumScaleFactor(0.75)
        }
    }
}

// MARK: FullScreen ViewType
fileprivate typealias FullScreen = TodoView.FullScreen
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
            HStack {
                TodoView()
                    //.namedPreview("Incomplete Card Todo")
                TodoView(complete: true)
            }
            .namedPreview("Card")
            
            HStack {
                Timeline()
            }
            .namedPreview("Timeline")
        }
    }
}
