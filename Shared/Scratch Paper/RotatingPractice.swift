//
//  RotatingPractice.swift
//  Space
//
//  Created by Richard Campbell on 12/30/21.
//

import SwiftUI

struct RotatingPractice: View {
    @State private var degrees: Double = 180
    @State private var flipped: Bool = false
    
    var body: some View {
        ZStack {
            MyButton(degrees: $degrees, color: .red)
            MyButton(degrees: $degrees, color: .blue)
        }
    }
}

struct MyButton: View {
    @Binding var degrees: Double
    let color: Color
    
    var body: some View {
        Button(action: {
            degrees += 50
            degrees.formTruncatingRemainder(dividingBy: 360)
        }) {
            Text("Placeholder")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Capsule().fill(color))
                .rotation3DEffect(.degrees(degrees), axis: (x:0, y:1, z:0))
        }
    }
}

enum Flipped: String {
    case front
    case back
    
    func toggle() -> Void {
       // if self.rawValue == front ? .back
    }
}

struct RotatingPractice_Previews: PreviewProvider {
    static var previews: some View {
        RotatingPractice()
    }
}
