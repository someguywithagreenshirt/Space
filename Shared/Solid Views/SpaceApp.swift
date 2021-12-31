//
//  SpaceApp.swift
//  Shared
//
//  Created by Richard Campbell on 12/20/21.
//

import SwiftUI


/// Named Space because of plans to turn it into AR world.
/// It can also mean like "give me space" since it should provide margin in life.
///
///
// TODO: Gasp, another todo list
// - [ ] Calendar Views
    // - [ ] View that shows all the days in a month, like normal calendar. Click day to zoom into planner for that day.
    // - [ ] View that shows all months, click on month to zoom to that calendar month.
    // - [ ] View that shows all years, etc.
    // - [ ] For Zooming effect: https://www.youtube.com/watch?v=x7fdvXdVd98
// - [ ] View that shows imports from calendars gmail/icloud/outlook need to be supported
    // - [ ] View to handle import and setup that sync
// - [ ] Todo ScrollView list, normal list, but tap to turn into compact card,
    // tap again to go to full card. Drag out of list to be compact card and drop on timeblocking.
// - [ ] Choose theme/colors screen
// - [ ] a
// - [ ] a
// - [ ] a
// - [ ] a
@main
struct SpaceApp: App {
    @StateObject private var stateController = StateController()
    
    var body: some Scene {
        WindowGroup {
            if ( UIDevice.current.model.range(of: "iPad") != nil){
                //print("I AM IPAD")
                //TBOmegaView()
//                Flashcard(front: { Text("Front")
//                        .font(.largeTitle)
//                        .padding(150)
//                        .background(Capsule().fill(.blue))
//                },
//                          back: {Text("Back")
//                        .font(.largeTitle)
//                        .padding(150)
//                        .background(Capsule().fill(.blue))
//                })
                
                DecisionTree()
            } else {
                //print("I AM IPHONE")
                ContentView()
                    .environmentObject(stateController)
            }
        }
    }
}
