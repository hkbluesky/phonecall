//
//  Cardify.swift
//  phonecall
//
//  Created by Tom Lou on 4/6/21.
//

import SwiftUI

struct Cardify: AnimatableModifier  {
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0:180
    }
    
    func body(content: Content) -> some View {
        ZStack {
        Group {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            content
        }
            .opacity(isFaceUp ? 1 : 0)
         RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
            .opacity(isFaceUp ? 0 : 1)
        
    }
    .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0.0, y: 1.0, z: 0.0))

    }
    
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75

    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

