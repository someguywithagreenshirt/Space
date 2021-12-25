//
//  Timeline.swift
//  Space
//
//  Created by Richard Campbell on 12/24/21.
//

import SwiftUI

struct Timeline: View {
    var hours: Int = 16
    
    var body: some View {
        //ScrollViewReader { svp in
           // ScrollView (.vertical, showsIndicators: true) {
                TimelineLine()
            //}
            //.frame(width: 503.0, height: CGFloat(100 * hoursToBlocks(hours)))
            .frame(maxWidth: .infinity, minHeight: CGFloat(100 * hoursToBlocks(hours)), idealHeight: CGFloat(100 * hoursToBlocks(hours)), maxHeight: CGFloat(100 * hoursToBlocks(hours)))
            .padding()
      //  }
        //.frame(width: 503.0, height: CGFloat(100 * hoursToBlocks(hours)))
    }
    
}

extension Timeline {
    func hoursToBlocks (_ hours: Int) -> Int {
        return hours * 2
    }
}

// MARK: Timeline
extension Timeline {
    struct TimelineLine: View {
        @State var timeBlocksInTimeline: Int = 32 //16 hours
        
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 3, height: CGFloat(100 * timeBlocksInTimeline))
                    .background(.secondary)
                    .padding(.top, 20)
                VStack {
                    // These may need to be generated dynamically to adjust hours.
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                    }
                    Group {
                        Rectangle()
                            .frame(width: 30, height: 3)
                        Spacer()
                        Rectangle()
                            .frame(width: 30, height: 3)
                    }
                    
                }
                .padding(.top, 20)
                // Hours
                VStack {
                    Group {
                        Text("6")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("7")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("8")
                        Spacer()
                    }
                    Group {
                        Text("")
                        Spacer()
                        Text("9")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("10")
                        Spacer()
                        Text("")
                        Spacer()
                    }
                    Group {
                        Text("11")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("12")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("1")
                        Spacer()
                    }
                    Group {
                        Text("")
                        Spacer()
                        Text("2")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("3")
                        Spacer()
                        Text("")
                        Spacer()
                    }
                    Group {
                        Text("4")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("5")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("6")
                        Spacer()
                    }
                    Group {
                        Text("")
                        Spacer()
                        Text("7")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("8")
                        Spacer()
                        Text("")
                        Spacer()
                    }
                    Group {
                        Text("9")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("10")
                        Spacer()
                        Text("")
                        Spacer()
                        Text("11")
                        Spacer()
                    }
                    Group {
                        Text("")
                        Spacer()
                        Text("12")
                    }
                }
                .padding(.trailing, 25.0)
                .padding(.bottom, 8.0)
                .foregroundColor(.red)
            }
        }
    }
}

// MARK: Previews
struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Timeline()
        }
        .namedPreview("Timeline")
    }
}
