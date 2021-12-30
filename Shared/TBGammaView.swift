//
//  TBGammaView.swift
//  Space
//
//  Created by Richard Campbell on 12/29/21.
//

import SwiftUI

struct TBGammaView: View {
    let hours = 18
    
    var body: some View {
        GeometryReader { grp in
            let grpFrame = grp.frame(in: .local)
            let pointArray = createHourLines(hours: hours,
                                             height: grpFrame.height,
                                             xPos: grpFrame.midX)
            let blockHeight = pointArray[1].y - pointArray[0].y
            let thirdOfBlock = blockHeight / 3
            let secondLineOffset = (blockHeight / 3) + (blockHeight / 3)
            
            let hourStart = 6
            
            ZStack {
                //                Rectangle()
                //                    .frame(width: 3, height: grpFrame.height)
                //                    .position(x: grpFrame.midX, y: grpFrame.midY)
                
                
//                VStack (spacing: 0) {
//                    ForEach (pointArray, id: \.self) { hour in
//                        VStack (spacing: 0) {
//                            Rectangle()
//                                .frame(width: 3, height: blockHeight / 3)
//                                .position(hour)
//                            Text("\(hourStart)")
//                            Rectangle()
//                                .frame(width: 3, height: blockHeight / 3)
//                                .position(x: hour.x, y: hour.y + secondLineOffset)
//                        }
//                    }
//                }
                
                
                
//                VStack (spacing: 0) {
//                    Rectangle()
//                        .frame(width: 3, height: blockHeight / 3)
//                        .position(pointArray[0])
//                        .offset(x: 0, y: (blockHeight / 3) / 2)
//                    Text("6:00")
//                    Rectangle()
//                        .frame(width: 3, height: blockHeight / 3)
//                        .position(pointArray[0])
//                        .offset(x: 0, y: thirdOfBlock * 2)
//
//                }
                TripleChunk(blockHeight: blockHeight, thirdOfBlock: thirdOfBlock, position: pointArray[0])
                
                ForEach (pointArray, id: \.self) { hour in
                    Rectangle()
                    // 15 may look better. Old planner was
                    // (grpFrame.height / CGFloat(hours) ) * 2 is 146.8888
                        .frame(width: 49, height: 3)
                        .position(hour)
                }
            }
        }
    }
}

struct TripleChunk: View {
    let blockHeight: CGFloat
    let thirdOfBlock: CGFloat
    let position: CGPoint
    
    var body: some View {
        VStack (spacing: 0) {
            Rectangle()
                .frame(width: 3, height: blockHeight / 3)
                .position(position)
                .offset(x: 0, y: (blockHeight / 3) / 2)
            Text("6:00")
            Rectangle()
                .frame(width: 3, height: blockHeight / 3)
                .position(position)
                .offset(x: 0, y: thirdOfBlock * 2)
            
        }
    }
}

extension TBGammaView {
    func createHourLines (hours: Int, height: CGFloat, xPos: CGFloat) -> [CGPoint] {
        var hourLines: [CGPoint] = []
        // this is truncating and is bad.
        let lineHeight: CGFloat = height / CGFloat(hours)
        
        // We need 19 lines for 18 hours; so start at zero
        for hour in 0 ... hours {
            hourLines.append(CGPoint(x: xPos, y: CGFloat(lineHeight) * CGFloat(hour)) )
        }
        precondition(hourLines.count > 2)
        return hourLines
    }
}

struct TBGammaView_Previews: PreviewProvider {
    static var previews: some View {
        TBGammaView()
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
