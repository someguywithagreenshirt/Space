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
    
    let data = (1...31).map { "Day \($0)" }
    
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
            MonthDateSquares(columns: columns, data: data)
            Spacer()
        }
    }
}

struct MonthDateSquares: View {
    
    let columns: [GridItem]
    let data: [String]
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .padding()
                        .frame(width: geo.size.width / 8 - 3, height: geo.size.height/4)
                        
                        .background(Rectangle()
                                        .stroke(lineWidth: 1))
                        
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}


/// Help LazyVStack Draw the month as a calendar
/// - Parameters:
///   - month: The month you want drawn
///   - year: The year you want that month drawn as
/// - Returns: -1 for weekblock,
///             nil for nothing,
///             day of month as Int for proper days
func howToDraw(month: Calendar.Component,
               year: Calendar.Component?) -> [Int?] {
    
    let calendar = Calendar.current
    var monthArray: [Int?] = (0..<31).map { $0 }
    
    monthArray[0] = -1
    monthArray[8] = -1
    monthArray[16] = -1
    monthArray[24] = -1
    
    
    
    
    return monthArray
}

func turnNumberIntoMonthWords (num: Int) -> String {
    switch num {
    case -1:
        return "Week"
    case 0:
        return "January"
    case 1:
        return "February"
    case 2:
        return "March"
    case 3:
        return "April"
    case 4:
        return "May"
    case 5:
        return "June"
    case 6:
        return "July"
    case 7:
        return "August"
    case 8:
        return "September"
    case 9:
        return "October"
    case 10:
        return "November"
    case 11:
        return "December"
    default:
        return "No Month Found"
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
            .previewIpad(.ipadPro12)
    }
}
