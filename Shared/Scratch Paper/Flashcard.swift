//
//  Flashcard.swift
//  Space
//
//  Created by Richard Campbell on 12/30/21.
//

import SwiftUI




struct Flashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
    }
    
    var body: some View {
        ZStack {
            if flipped {
                back()
            } else {
                front()
            }
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            Rectangle()
                //.stroke(Color.black, lineWidth: 2)
                .fill(.blue)
        )
        .padding()
        .onTapGesture {
            flipFlashcard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipFlashcard() {
        let animationTime = 5.5
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
}

struct Flashcard_Previews: PreviewProvider {
    static var previews: some View {
        Flashcard(front: { Text("Front")
                .font(.largeTitle)
                //.padding(150)
                //.background(Capsule().fill(.blue))
        },
                  back: {Text("Back")
                .font(.largeTitle)
                //.padding(150)
                //.background(Capsule().fill(.blue))
        })
    }
}
