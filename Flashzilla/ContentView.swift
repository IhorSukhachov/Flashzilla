//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI
internal import Combine

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor: Bool
    
    @State private var count = 0

    var body: some View {
        HStack {
             if accessibilityDifferentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("Success")
        }
        .padding()
        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
//        Text("Hello world")
//            .onChange(of: scenePhase) { oldPhase, newPhase in
//                if newPhase == .active {
//                    print("Active")
//                } else if newPhase == .inactive {
//                    print("Inactive")
//                } else if newPhase == .background {
//                    print("Background")
//                }
//            }
//            .onReceive(timer) {time in
//                if count == 5 {
//                    timer.upstream.connect().cancel()
//                } else {
//                    print("The time is now \(time)")
//                }
//                count += 1
//            }
    }
    
//    func cancelTimer() {
//        timer.upstream.connect().cancel()
//    }
}

#Preview {
    ContentView()
}
