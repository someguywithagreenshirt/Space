//
//  SpaceApp.swift
//  Shared
//
//  Created by Richard Campbell on 12/20/21.
//

import SwiftUI


/// Named Space because of plans to turn it into AR world.
/// It can also mean like "give me space" since it should provide margin in life.
@main
struct SpaceApp: App {
    @StateObject private var stateController = StateController()
    
    var body: some Scene {
        WindowGroup {
            if ( UIDevice.current.model.range(of: "iPad") != nil){
                //print("I AM IPAD")
                PlannerView()
            } else {
                //print("I AM IPHONE")
                ContentView()
                    .environmentObject(stateController)
            }
        }
    }
}
