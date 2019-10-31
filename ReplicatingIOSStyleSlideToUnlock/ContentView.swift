//
//  ContentView.swift
//  ReplicatingIOSStyleSlideToUnlock
//
//  Created by ramil on 31.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var chromaShift = false
    @State private var slide = false
    var body: some View {
        ZStack {
            Text("Slide to unlock")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .hueRotation(.degrees(chromaShift ? 0 : 720))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear() {
                    self.chromaShift.toggle()
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(maxWidth: 200, maxHeight: 40)
                .rotationEffect(.degrees(0), anchor: .trailing)
                .opacity(0.5)
                .scaleEffect(x: slide ? 0 : 1, y: 1, anchor: .trailing)
                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false).speed(2))
                .onAppear() {
                    self.slide.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
