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
    
    @State private var count = 0

    var body: some View {
        Text("Hello world")
            .onReceive(timer) {time in
                if count == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                count += 1
            }
    }
    
//    func cancelTimer() {
//        timer.upstream.connect().cancel()
//    }
}

#Preview {
    ContentView()
}
