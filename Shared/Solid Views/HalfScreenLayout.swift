//
//  MakePrettier.swift
//  Space
//
//  Created by Richard Campbell on 12/30/21.
//

import SwiftUI

struct HalfScreenLayout: View {
    // allow two views to be passed in and set.
    
    var body: some View {
        GeometryReader { fullScreen in
            HStack (spacing: 0){
                ZStack {
                    GeometryReader { leftHalfOfScreen in
                        let lhs = leftHalfOfScreen.frame(in: .named("LHS"))
                        // -20 is .left, .right padding
                        TBOmegaView(cardWidth: (lhs.size.width / 2) - 20 )
                            .coordinateSpace(name: "LHS")
                    }
                    .frame(width: fullScreen.size.width/3, height: fullScreen.size.height)
                    
                }
                
                ZStack  {
                    GeometryReader { rightHalfOfScreen in
                        let rhs = rightHalfOfScreen.frame(in: .local)
                        VStack (spacing: 0) {
                            
                            HStack {
                                // left column (on right)
                                VStack (spacing: 12){
                                    let columnWidth = (rhs.width / 2) / 3
                                    Group {
                                        HeaderBubble("Header",
                                                     width: columnWidth)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                    }
                                    Group {
                                        HeaderBubble("Header",
                                                     width: columnWidth)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                    }
                                    Group {
                                        HeaderBubble("Header",
                                                     width: columnWidth)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                        Line(width: rhs.width / 2)
                                            .padding(.top, 50)
                                    }
                                }
                                // right column (on right)
                                VStack {
                                    TodayView()
                                }
                            }
                        }
                        Color.clear
                    }
                }
                
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct Line: View {
    let width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: width, height: 3)
    }
}

struct HeaderBubble: View {
    let header: String
    let width: CGFloat
    
    var body: some View {
        Text(header)
            .font(.largeTitle)
            .padding([.top, .bottom])
            .padding([.leading, .trailing], width)
            .background(RoundedRectangle(cornerRadius: 12).fill(.cyan))
    }
}

extension HeaderBubble {
    init(_ header: String, width: CGFloat) {
        self.header = header
        self.width = width
    }
}

struct HalfScreenLayout_Previews: PreviewProvider {
    static var previews: some View {
        HalfScreenLayout()
            .previewIpad(.ipadPro12)
    }
}
