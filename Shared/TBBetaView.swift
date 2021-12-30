//
//  TBBetaView.swift
//  Space
//
//  Created by Richard Campbell on 12/29/21.
//

import SwiftUI

struct TBBetaView: View {
    let hours = 18
    
    var body: some View {
        GeometryReader { grp in
            let grpFrame = grp.frame(in: .local)
            
            ZStack {
                Rectangle()
                    .frame(width: 3, height: grpFrame.height)
                    .position(x: grpFrame.midX, y: grpFrame.midY)
                
                let pointArray = createHourLines(hours: hours, height: grpFrame.height, xPos: grpFrame.midX)
                ForEach (pointArray, id: \.self) { hour in
                    Rectangle()
                    // matches length in current planner. 15 may look better. (grpFrame.height / CGFloat(hours) ) * 2 is 146.8888
                        .frame(width: 49, height: 3)
                        .position(hour)
                }
            }
        }
    }
}



extension TBBetaView {
    func createHourLines (hours: Int, height: CGFloat, xPos: CGFloat) -> [CGPoint] {
        var hourLines: [CGPoint] = []
        // this is truncating and is bad.
        let lineHeight: CGFloat = height / CGFloat(hours)
        
        // We need 19 lines for 18 hours; so start at zero
        for hour in 0 ... hours {
            hourLines.append(CGPoint(x: xPos, y: CGFloat(lineHeight) * CGFloat(hour)) )
        }
        
        return hourLines
    }
}

struct TBBetaView_Previews: PreviewProvider {
    static var previews: some View {
        TBBetaView()
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
