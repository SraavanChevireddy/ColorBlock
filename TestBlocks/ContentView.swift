//
//  ContentView.swift
//  TestBlocks
//
//  Created by Sraavan Chevireddy on 11/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var canShow = false
    @State var color: Color = .purple
    var colors = [Color.red, Color.yellow, Color.teal, Color.black, Color.accentColor, Color.purple]
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 50)
            conditionalView
            Rectangle()
                .foregroundColor(.red)
            Spacer()
        }
        .padding()
        .onReceive(timer) { _ in
            canShow.toggle()
        }.animation(.linear, value: canShow)
            .transition(.move(edge: .top))
    }
    
    var conditionalView: some View {
        #warning("Change this to VStack to see the difference")
        return Group {
            if canShow {
               Rectangle()
                    .foregroundColor(color)
                    .frame(height: 50)
            } else {
                EmptyView()
            }
        }.onAppear{
            color = colors.randomElement() ?? Color.white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
