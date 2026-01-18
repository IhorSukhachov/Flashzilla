//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAngleAmount = Angle.zero
    @State private var finalAngleAmount = Angle.zero
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .scaleEffect(finalAmount + currentAmount)
                .rotationEffect(currentAngleAmount + finalAngleAmount)
                .gesture(
//                    MagnifyGesture()
//                        .onChanged {value in
//                            currentAmount = value.magnification - 1
//                        }
//                        .onEnded {value in
//                            finalAmount += currentAmount
//                            currentAmount = 0.0
//                        }
                    
                    RotateGesture()
                        .onChanged {value in
                            currentAngleAmount = value.rotation
                        }
                        .onEnded {value in
                            finalAngleAmount += currentAngleAmount
                            currentAngleAmount = .zero
                        }
                        
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
