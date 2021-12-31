//
//  OneMonthCalendarView.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import SwiftUI

/* Apple Example of LazyHGrid
 var rows: [GridItem] =
         Array(repeating: .init(.fixed(20)), count: 2)
 ScrollView(.horizontal) {
     LazyHGrid(rows: rows, alignment: .top) {
         ForEach((0...79), id: \.self) {
             let codepoint = $0 + 0x1f600
             let codepointString = String(format: "%02X", codepoint)
             Text("\(codepointString)")
                 .font(.footnote)
             let emoji = String(Character(UnicodeScalar(codepoint)!))
             Text("\(emoji)")
                 .font(.largeTitle)
         }
     }
 }
 */


struct OneMonthCalendarView: View {
    let todaysDate = Date()
    let calendar: Calendar = Calendar(identifier: .gregorian)
    
    var rows: [GridItem] =
            Array(repeating: .init(.fixed(20)), count: 2)
    
    
    
    let leftToolbarItems = ["sidebar.left",
                            "calendar.day.timeline.leading",
                            "person.crop.circle"]
    let rightToolbarItems = ["gearshape" ,
                             "star",
                             "sidebar.right"]
    
    var body: some View {
        
        VStack {
            Header(leftIcons: leftToolbarItems, calendar: calendar, rightIcons: rightToolbarItems)
            Spacer()
        }
    }
}

struct Header: View {
    let leftIcons: [String]
    let calendar: Calendar
    let rightIcons: [String]
    
    var body: some View {
        HStack {
            LeftToolbars(systemNames: leftIcons)
            Spacer()
            Text("\(DateFormatter().monthSymbols[calendar.component(Calendar.Component.month, from: Date()) - 1])")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .padding(.leading, 100)
                .padding(.trailing, 100)
            .background(RoundedRectangle(cornerRadius: 25).fill(.cyan))
            Spacer()
            RightToolbars(systemNames: rightIcons)
        }
        .font(.largeTitle)
        .padding()
    }
}

extension Header {
    struct LeftToolbars: View {
        let systemNames: [String]
        
        var body: some View {
            ForEach (systemNames, id: \.self) { systemName in
                // MARK: Make NavigationLinks
                Image(systemName: systemName)
            }
        }
    }
    
    struct RightToolbars: View {
        let systemNames: [String]
        
        var body: some View {
            ForEach (systemNames, id: \.self) { systemName in
                Image(systemName: systemName)
            }
        }
    }
}



struct OneMonthCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        OneMonthCalendarView()
    }
}
