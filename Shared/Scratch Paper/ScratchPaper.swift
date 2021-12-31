//
//  ScratchPaper.swift
//  Space
//
//  Created by Richard Campbell on 12/31/21.
//

import SwiftUI

struct ScratchPaper: View {
    
    
    
    let data = (1...31).map { "Day \($0)" }
    
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
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .padding()
                        .frame(width: geo.size.width / 8 - 1, height: geo.size.height/4)
                        .background((.cyan))
                        .border(.black, width: 1)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}

struct ScratchPaper_Previews: PreviewProvider {
    static var previews: some View {
        ScratchPaper()
    }
}
