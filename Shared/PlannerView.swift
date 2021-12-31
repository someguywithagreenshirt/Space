//
//  PlannerView.swift
//  Space
//
//  Created by Richard Campbell on 12/27/21.
//

import SwiftUI

//struct PlannerView: View {
//    var body: some View {
//        // This one should be the whole screen
//        ZStack {
//            // The backmost material on the screen
//            ZStack {
//                RoundedRectangle(cornerRadius: 24)
//                    .foregroundColor(.blue)
//            }
//            // Main Content View
//            ZStack {
//                RoundedRectangle(cornerRadius: 24)
//                    //.foregroundColor(.blue)
//                    .frame(width: 200, height: 200)
//                    .background(.regularMaterial)
//                Text ("What even is that thing")
//                    .padding()
//                    .background(.regularMaterial)
//            }
//            // For Special PopUps I may want or need.
//            // Should maybe really just consider using actionsheet or other alerts.
//            ZStack {
//                RoundedRectangle(cornerRadius: 24)
//                    .foregroundColor(.green)
//                    .frame(width: 10, height: 10)
//                //.foregroundColor(Material.thinMaterial)
//            }
//        }
//    }
//}




struct PlannerView: View {
    
    var body: some View {
        ZStack {
            // BackgroundView
            Color.secondary
            
            // Screen layout engine view
            HStack {
                // The entire timeline chunk
                ZStack {
                    GeometryReader { timeblockingReader in
                        //let tbr: CGRect = timeblockingReader.frame(in: .local)
                        
                        
                        TimeblockingSkeletonView()
                        
                        // The Blocking layer
                        EmptyView()
                    }
                }
                .padding()
                
                // Goals, Priorities and othe stuff
                EmptyView()
            }
            
            
            // I think that is it and that this makes the most sense.
            // There is obviously some other layers that will need to be created.
            
        }
    }
}

struct PlannerView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        PlannerView()
            .previewWithName("iPad")
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipad9.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
