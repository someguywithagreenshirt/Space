//
//  RoundedCorner.swift
//  Space
//
//  Created by Richard Campbell on 12/23/21.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// Extension on View that makes this possible
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCornerTester: View {
    @State var topLeft: CGFloat = 0
    @State var topRight: CGFloat = 50
    @State var bottomLeft: CGFloat = 50
    @State var bottomRight: CGFloat = 50
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(String(format: "%.1f", Double(topLeft)))
                    Slider(value: $topLeft, in: 0...50)
                }
                VStack {
                    Text(String(format: "%.1f", Double(topRight)))
                    Slider(value: $topRight, in: 0...50)
                }
            }
            
            Text("Round Me").frame(width: 200, height: 100)
                .background(.red)
                .cornerRadius(topLeft, corners: .topLeft)
                .cornerRadius(topRight, corners: .topRight)
                .cornerRadius(bottomLeft, corners: .bottomLeft)
                .cornerRadius(bottomRight, corners: .bottomRight)
            
            HStack {
                VStack {
                    Slider(value: $bottomLeft, in: 0...50)
                    Text(String(format: "%.1f", Double(bottomLeft)))
                }
                VStack {
                    Slider(value: $bottomRight, in: 0...50)
                    Text(String(format: "%.1f", Double(bottomRight)))
                }
            }
        }
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerTester()
    }
}
