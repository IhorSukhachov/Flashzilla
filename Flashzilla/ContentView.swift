//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI
internal import Combine

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor: Bool
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion: Bool
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency: Bool
    
    @State private var scale = 1.0
    
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
        Button("Hello world") {
                 withOptionalAnimation {
                     scale *= 1.5
                 }
             }
        .scaleEffect(scale)
        
        Text("Reduce transparency testing")
            .padding()
            .background(accessibilityReduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
    
//    func cancelTimer() {
//        timer.upstream.connect().cancel()
//    }
}

#Preview {
    ContentView()
}
