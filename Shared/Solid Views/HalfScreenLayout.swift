//
//  MakePrettier.swift
//  Space
//
//  Created by Richard Campbell on 12/30/21.
//

import SwiftUI

struct HalfScreenLayout: View {
    var body: some View {
        HStack (spacing: 0){
            ZStack {
                GeometryReader { leftHalfOfScreen in
                    Color.clear
                }
                
            }
            ZStack  {
                GeometryReader { rightHalfOfScreen in
                    Color.clear
                }
            }
            
            
        }
    }
}

struct MakePrettier_Previews: PreviewProvider {
    static var previews: some View {
        HalfScreenLayout()
            .previewIpad(.ipadPro12)
    }
}
