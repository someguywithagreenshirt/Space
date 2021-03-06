//
//  TodoView.swift
//  Space
//
//  Created by Richard Campbell on 12/22/21.
//

import SwiftUI

struct TodoView: View, ViewTypeProtocol {
    var viewType: ViewType = .card
    let allViewTypes: [ViewType] = ViewType.allCases
    var complete = false
    let title: String = TestData.title
    let description: String = TestData.description
    
    var body: some View {
        switch viewType {
        case .card:
            Card(complete: complete) // temp pass-in for previews
        case .timeline:
            TimelineTodo()
        case .fullscreen:
            FullScreen()
        case .ghost:
            EmptyView()
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
                .padding([.top, .leading, .trailing], 8.0)
                
                VStack {
                    Divider()
                    Text(description)
                        .font(.caption)
                    
                    Spacer()
                }
                .frame(minWidth: 200, maxWidth: 250, minHeight: 200, maxHeight: 300)
                .padding(.all, 8.0)
                .background(.secondary)
                .cornerRadius(25, corners: .bottomLeft)
                .cornerRadius(25, corners: .bottomRight)
                .minimumScaleFactor(0.5)
                
            }
            .background(.secondary)
            .cornerRadius(25)
        }
    }
}

// MARK: Compact ViewType
fileprivate typealias TimelineTodo = TodoView.Timeline
extension TodoView {
    struct Timeline: View {
        var complete = false
        let title: String = TestData.title
        let description: String = TestData.description
        
        var body: some View {
            
            VStack (alignment: .leading, spacing: 2){
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
                
                Divider()
                    .padding(0)
                
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
                TimelineTodo()
            }
            .namedPreview("Timeline")
        }
    }
}
