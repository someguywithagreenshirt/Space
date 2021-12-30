//
//  TimeBlockingView.swift
//  Space
//
//  Created by Richard Campbell on 12/29/21.
//

import SwiftUI

#warning("Clean up warnings")
// TODO: Yet Another Todo List
// - [ ] Test if a center point is enough to place notecard
// - [ ] Define each position in exact grp terms
// - [ ] Use asserts more often (and do the compile out thing from twostraws talk
// - [ ] enum BreakPoint for use with conditionalBreakpoints
struct TimeBlockingView: View {
    let hours: [Int] = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    
    var body: some View {
        GeometryReader { grp in
            let grpFrame = grp.frame(in: .local)
            
            ZStack {
                
                // The hour lines
                VStack (spacing: 0){
                    ForEach (hours, id: \.self) { hour in
                        Rectangle()
                            .frame(width: 15, height: 3)
                        // ensure that line touches bottom
                        if (hour != 24) {
                            Spacer()
                        }
                    }
                }
                
                // The middle line
                HStack {
                    Spacer()
                    Rectangle()
                        .frame(width: 3, height: grpFrame.height)
                    Spacer()
                }
                
                // The numbers
                VStack (spacing: 0){
                    ForEach (hours, id: \.self) { hour in
                        if (hour != 6 && hour != 24){
                            Text("\(hour)")
                            //.fontWeight(.bold)
                            Spacer()
                        } else if hour == 6 {
                            Spacer()
                        }
                        
                    }
                    // extra needed for last hour
                    Text("24")
                }
                .offset(x: -13, y: 0)
                //.position(<#T##position: CGPoint##CGPoint#>)
                
                // timeblocks
                HStack {
                    VStack (spacing: 1){
                        ForEach (0 ..< hours.count - 1) { _ in
                            TimeBlockingZone(.blue)
                        }
                    }
                    VStack (spacing: 1){
                        ForEach (0 ..< hours.count - 1) { _ in
                            TimeBlockingZone(.red)
                        }
                    }
                }
               
                //}
//                VStack {
//                    ForEach(0 ..< hours.count - 1) { item in
//                        Color.secondary
//                            .frame(width: 200,
//                                   height: grpFrame.height / CGFloat(hours.count))
//                            .cornerRadius(25, corners: .topLeft)
//                            .cornerRadius(25, corners: .bottomLeft)
//                    }
//                }
            }
        }
    }
}

struct TimeBlockingZone: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.clear)
            .frame(width: 200)
            .cornerRadius(25, corners: .topLeft)
            .border(color)
    }
}

extension TimeBlockingZone {
    init(_ color: Color) {
        self.color = color
    }
}

struct TimeBlockingView_Previews: PreviewProvider {
    static var previews: some View {
        TimeBlockingView()
            //.preferredColorScheme(.dark)
        //.previewWithName("iPad")
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
