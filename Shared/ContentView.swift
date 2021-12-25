//
//  ContentView.swift
//  Shared
//
//  Created by Richard Campbell on 12/20/21.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        VStack {
//            VStack {
//                ScrollView {
//                    Timeline()
//                }
//            }
//        }
//    }
    
    //@State private var isLoggingIn = false
    //@EnvironmentObject private var stateController: StateController
    //@EnvironmentObject private var settingsController: SettingsController
    //@AppStorage(Lifehacks_swiftuiApp.Keys.isLoggedIn) private var isLoggedIn = false
    @SceneStorage("ContentView.SelectedTab") private var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab){
            NavigationView {
                ScrollView {
                    Timeline()
                }
            }
            .tabItem { Label("Timeline", systemImage: "calendar.day.timeline.left") }
            .tag(0)
            
            NavigationView {
                Text("Today View")
            }
            .tabItem { Label("Today", systemImage: "star.square") }
            .tag(1)
            
            NavigationView {
                TodoView()
            }
            .tabItem { Label("Todos", systemImage: "checkmark.square") }
            .tag(2)
            
            NavigationView {
                Text("Project View")
            }
            .tabItem { Label("Projects", systemImage: "square.3.layers.3d.down.right") }
            .tag(3)
            
            NavigationView {
                Text("Settings View")
            }
            .tabItem { Label("Settings", systemImage: "gear") }
            .tag(4)
        }
        //.accentColor(settingsController.theme.accentColor)
        //.environment(\.theme, settingsController.theme)
        //.onAppear { isLoggingIn = !isLoggedIn }
        //.fullScreenCover(isPresented: $isLoggingIn) {
        //    LoginView()
        //        .accentColor(settingsController.theme.accentColor)
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
