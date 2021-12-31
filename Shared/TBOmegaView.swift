//
//  TBOmegaView.swift
//  Space
//
//  Created by Richard Campbell on 12/30/21.
//

import SwiftUI

#warning("Todo List")
// - [ ] There is also a todo list on the main SpaceApp file
// CMD + " brings me directly to here.
//
// TODO: Models
// - [X] Create test model for realityView
// - [ ] TestData for the plannerView is very important
// - [ ] Create models for timeblocking
// - [ ] Read Todo info from CoreData
//
// TODO: Views
// - [ ] TimelineView
    // - [ ] Test if a center point is enough to place notecard
    // - [ ] Define each position in exact grp terms
    // - [ ] VStack of ghost todos
//
// TODO: Controllers
// - [ ] DateFormatter to get date and times in format I need. Saturday March 04th HH:mm
// - [ ] I started doing my own thing because I don't know Date() well enough.
// - [ ] Get encoders and decoders setup
//
// TODO: Tasks
// - [ ] How do draggable cells in a List work exactly?
// - [ ] Turn some of the above and the preview code into snippets
//
// TODO: Tips
// - [ ] Make ContentView a list of all the destination pages in my app so I can test any out that I need to more quickly
// - [ ] Use asserts more often (and do the compile out thing from twostraws talk
// - [ ] enum BreakPoint for use with conditionalBreakpoints

struct TBOmegaView: View {
    // set the size of the array to hours and never let it increase
    // Use optionals. If that position(hour) is nil, then show ghost view
    
    
    //@State var plan: [IndividualBlock] = []
    @State var reality = TestData.realityLine
    let cardWidth: CGFloat
    
    let hours = 18
    let startHour = 6
    
    
    //let blockHeight: CGFloat = 73.444444444444442
    
    
    var body: some View {
        GeometryReader { grp in
            let grpFrame = grp.frame(in: .local)
            
            
            let positionOfEachHourStart: [CGPoint] = createHourLines(hours: hours,
                                                                     height: grpFrame.height,
                                                                     xPos: grpFrame.midX,
                                                                     includeLast: false)
            
            let blockHeight = positionOfEachHourStart[1].y - positionOfEachHourStart[0].y
            
            //let blockCheck = grpFrame.height / CGFloat(hours)
            ZStack {
                
                TBGammaView(hours: hours, startHour: startHour)
                
                ForEach (0..<hours) { pos in
                    Rectangle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.secondary)
                        .frame(width: cardWidth, height: blockHeight)
                        .position(positionOfEachHourStart[pos])
                        .offset(x: -cardWidth/2, y: blockHeight / 2.0)
                }
                ForEach (0..<hours) { pos in
                    Rectangle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.secondary)
                        .frame(width: cardWidth, height: blockHeight)
                        .overlay(
                            VStack (alignment: .leading, spacing: 0){
                                Text("Todo")
                                Text("Description")
                            })
                        .position(positionOfEachHourStart[pos])
                        .offset(x: cardWidth/2, y: blockHeight / 2.0)
                }
                
//                VStack (spacing: 0){
//                    ForEach (reality, id: \.self) { block in
//                        block
//                    }
//
//                }
//                .position(positionOfEachHourStart[0])
//                .offset(x: -101, y: grpFrame.height / 2 )
//
//                VStack (spacing: 0){
//                    ForEach (reality, id: \.self) { block in
//                        BlockingBlock()
//                    }
//
//                }
//                .position(positionOfEachHourStart[0])
//                .offset(x: 101, y: grpFrame.height / 2 )
                
            }
        }
    }
}

struct BlockingBlock: View {
    let blockHeight = 73.444444444444442
    
    var body: some View {
        Rectangle()
            .foregroundColor(.secondary)
            .frame(width: 200, height: blockHeight)
            .border(.black)
    }
}


struct IndividualBlock: View {
    let blockWidth: CGFloat
    let blockHeight: CGFloat
    let title = TestData.todo1.title
    let description = TestData.todo1.description
    
    var body: some View {
        VStack (alignment: .leading,spacing: 0) {
            Text(title)
                .font(.title3)
            Divider()
            Text(description)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        //.frame(width: 200, height: blockHeight, alignment: .leading)
        .frame(minWidth: blockWidth, idealWidth: blockWidth, maxWidth: blockWidth, minHeight: blockHeight, idealHeight: blockHeight, maxHeight: blockHeight, alignment: .leading)
        .background(.secondary)
        .border(.black)
    }
}

extension IndividualBlock: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(blockHeight)
        hasher.combine(title)
        hasher.combine(description)
    }
}


//extension TBOmegaView {
//    func addBlock(_ block: IndividualBlock) {
//        //for _ in 0 ..< 18 {
//            reality.append(block)
//        //}
//    }
//}

struct TBOmegaView_Previews: PreviewProvider {
    static var previews: some View {
        TBOmegaView(cardWidth: 200)
            .previewDevice(PreviewDevice(rawValue: DeviceNames.ipadPro12.rawValue))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
