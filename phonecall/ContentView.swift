//
//  ContentView.swift
//  phonecall
//
//  Created by Tom Lou on 3/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 15.0).stroke().foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("👻Hello11877k5d667").font(Font.largeTitle).padding()
        })
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Text("Hello, World!!")
    }
}
