//
//  DecisionTree.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import SwiftUI

struct DecisionTree: View {
    
    // MARK: Add $selection binding
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 15){
                Spacer()
                NavigationLink("Half Screen Layout",
                               destination: HalfScreenLayout())
                NavigationLink("Months",
                               destination: OneMonthCalendarView())
                TodayView()
                Spacer()
            }
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            //.navigationBarHidden(true)
            //.edgesIgnoringSafeArea(.top)
        }
        
        
    }
}

struct DecisionTree_Previews: PreviewProvider {
    static var previews: some View {
        DecisionTree()
    }
}
