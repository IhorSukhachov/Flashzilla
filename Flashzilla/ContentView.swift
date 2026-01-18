//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onLongPressGesture(minimumDuration:  1) {
                    print("Long press!")
                } onPressingChanged: { inProgress in
                    print("In progress \(inProgress)")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
