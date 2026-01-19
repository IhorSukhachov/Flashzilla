//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI
internal import Combine

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("Hello world")
            .onReceive(timer) {time in
                print("The time is now \(time)")
            }
    }
}

#Preview {
    ContentView()
}
