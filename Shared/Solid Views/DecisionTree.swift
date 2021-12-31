//
//  DecisionTree.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import SwiftUI

struct DecisionTree: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Half Screen Layout",
                               destination: HalfScreenLayout())
                NavigationLink("Months",
                               destination: OneMonthCalendarView())
                TodayView()
            }
            
            .font(.largeTitle)
            .foregroundColor(.blue)
        }
        .navigationBarHidden(true)
        
    }
}

struct DecisionTree_Previews: PreviewProvider {
    static var previews: some View {
        DecisionTree()
    }
}
