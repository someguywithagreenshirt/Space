//
//  OneMonthCalendarView.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import SwiftUI
import Algorithms

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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let columnsNoWeek = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var monthArray = { MonthLayout(Date()).monthLayout }
    
    let leftToolbarItems = ["sidebar.left",
                            "calendar.day.timeline.leading",
                            "person.crop.circle"]
    let rightToolbarItems = ["gearshape" ,
                             "star",
                             "sidebar.right"]
    
    var body: some View {
        
        VStack {
            Header(leftIcons: leftToolbarItems, rightIcons: rightToolbarItems)
            MonthDateSquares(columns: columns, data: monthArray()())
            Spacer()
        }
    }
}

struct MonthDateSquares: View {
    
    let columns: [GridItem]
    //let data: [Int]
    let data: [MonthBlockInfo]
    
    var body: some View {
        GeometryReader { geo in
            let monthBlockWidth = geo.size.width / 8 - 3
            let monthBlockHeight = geo.size.height / 2 - 3
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    Text(item.caseEnum.rawValue)
                        .padding()
                        .frame(width: monthBlockWidth, height: monthBlockHeight)
                    
                        .background(Rectangle()
                                        .stroke(lineWidth: 1))
             
             
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
        .navigationBarHidden(true)
    }
}

struct Header: View {
    let leftIcons: [String]
    let rightIcons: [String]
    
    var body: some View {
        HStack {
            LeftToolbars(systemNames: leftIcons)
            Spacer()
            Text("\(DateFormatter().monthSymbols[Calendar.current.component(Calendar.Component.month, from: Date()) - 1])")
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
            //nil has id of self
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
            .previewIpad(.ipadPro12)
    }
}
