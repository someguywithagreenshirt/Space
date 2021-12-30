//
//  TBGammaView.swift
//  Space
//
//  Created by Richard Campbell on 12/29/21.
//

import SwiftUI

struct TBGammaView: View {
    let hours = 18
    let startHour = 6
    
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
            
            
            VStack (spacing: 0) {
                ForEach (positionOfEachHourStart, id: \.self) { point in
                    TripleChunk(blockHeight: blockHeight,
                                text: (positionOfEachHourStart.firstIndex(of: point) ?? 7) + startHour)
                }
            }
            .position(positionOfEachHourLine[0])
            .offset(x: 0, y: grpFrame.height / 2 )
            
            ForEach (positionOfEachHourLine, id: \.self) { hour in
                Rectangle()
                    .frame(width: 49, height: 3)
                    .position(hour)
                
                
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
                    .padding(0)
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

extension TBGammaView {
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
}

struct TBGammaView_Previews: PreviewProvider {
    static var previews: some View {
        TBGammaView()
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
