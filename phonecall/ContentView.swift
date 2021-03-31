//
//  ContentView.swift
//  phonecall
//
//  Created by Tom Lou on 3/6/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
            
        HStack {
            ForEach( 0..<4) {index in
            CardView()
    }
    }
        .padding()
        .foregroundColor(.orange)
        .font(Font.largeTitle)

    }


}

struct CardView: View {
    var isFaceUp: Bool=true
    var body: some View {
        ZStack  {
            if isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text("👻").font(Font.largeTitle).padding()
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
}

        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
