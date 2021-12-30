//
//  TBGammaView.swift
//  Space
//
//  Created by Richard Campbell on 12/29/21.
//

import SwiftUI

struct TBGammaView: View {
    let hours: Int
    let startHour: Int
    
    var body: some View {
        GeometryReader { grp in
            let grpFrame = grp.frame(in: .local)
            let positionOfEachHourLine: [CGPoint] = createHourLines(hours: hours,
                                                                    height: grpFrame.height,
                                                                    xPos: grpFrame.midX,
                                                                    includeLast: true)
            let positionOfEachHourStart: [CGPoint] = createHourLines(hours: hours,
                                                                     height: grpFrame.height,
                                                                     xPos: grpFrame.midX,
                                                                     includeLast: false)
            let blockHeight = positionOfEachHourLine[1].y - positionOfEachHourLine[0].y
            ZStack {
                // Interpolated vertical line
                VStack (spacing: 0) {
                    ForEach (positionOfEachHourStart, id: \.self) { point in
                        TripleChunk(blockHeight: blockHeight,
                                    text: (positionOfEachHourStart.firstIndex(of: point) ?? 7) + startHour)
                    }
                }
                .position(positionOfEachHourLine[0])
                .offset(x: 0, y: grpFrame.height / 2 )
                
                // the horizontal line
                ForEach (positionOfEachHourLine, id: \.self) { hour in
                    Rectangle()
                        .frame(width: 49, height: 3)
                        .position(hour)
                }
                
//                VStack (spacing: 0){
//                    ForEach (TestData.realityLine, id: \.self) { _ in
//                        BlockingBlock()
//                    }
//
//                }
//                .position(positionOfEachHourStart[0])
//                .offset(x: 101, y: grpFrame.height / 2 )
                
//                ForEach (positionOfEachHourLine, id: \.self) { line in
//                    Circle()
//                        .stroke(lineWidth: 3)
//                        .frame(width: 25, height: 25)
//                        .foregroundColor(.red)
//                        .position(line)
//                }
                
//                ForEach (0..<hours) { pos in
//                    Rectangle()
//                        .stroke(lineWidth: 3)
//                        .frame(width: 200, height: blockHeight)
//                        .position(positionOfEachHourStart[pos])
//                        .offset(x: -100, y: blockHeight / 2.0)
//                }
            }
        }
    }
}

extension TBGammaView {
    struct TripleChunk: View {
        let blockHeight: CGFloat
        let text: Int
        
        var body: some View {
            VStack (spacing: 0) {
                Rectangle()
                    .frame(width: 3, height: blockHeight / 3)
                Text("\(text):00")
                    .frame(height: blockHeight / 3)
                Rectangle()
                    .frame(width: 3, height: blockHeight / 3)
            }
        }
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

//extension TBGammaView {
func createHourLines (hours: Int, height: CGFloat, xPos: CGFloat, includeLast: Bool) -> [CGPoint] {
    var hourLines: [CGPoint] = []
    // this is truncating and is bad.
    let lineHeight: CGFloat = height / CGFloat(hours)
    
    // We need 19 lines for 18 hours; so start at zero
    for hour in 0 ... hours {
        hourLines.append(CGPoint(x: xPos, y: CGFloat(lineHeight) * CGFloat(hour)) )
    }
    precondition(hourLines.count > 2)
    if includeLast {
        return hourLines
    } else {
        hourLines.removeLast()
        return hourLines
    }
}
//}

struct TBGammaView_Previews: PreviewProvider {
    static var previews: some View {
        TBGammaView(hours: 18, startHour: 6)
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
