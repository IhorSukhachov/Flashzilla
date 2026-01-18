//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ihor Sukhachov on 18.01.2026.
//

import SwiftUI

struct ContentView: View {
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
//    
//    @State private var currentAngleAmount = Angle.zero
//    @State private var finalAngleAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDraging = false
    
    var body: some View {
        let dragGesture = DragGesture().onChanged({ value in
            offset = value.translation
        }).onEnded  { _ in
            withAnimation {
                offset = .zero
                isDraging = false
            }
        }
                   
        let pressGesture = LongPressGesture()
            .onEnded { value in
            withAnimation {
                isDraging = true
            }
        }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
             .fill(Color.blue)
             .frame(width: 64, height: 64)
             .scaleEffect(isDraging ? 1.5 : 1.0)
             .offset(offset)
             .gesture(combined)
        
//        VStack {
////            Image(systemName: "globe")
////                .imageScale(.large)
////                .foregroundStyle(.tint)
////            Text("Hello, world!")
////                .scaleEffect(finalAmount + currentAmount)
////                .rotationEffect(currentAngleAmount + finalAngleAmount)
////                .gesture(
//////                    MagnifyGesture()
//////                        .onChanged {value in
//////                            currentAmount = value.magnification - 1
//////                        }
//////                        .onEnded {value in
//////                            finalAmount += currentAmount
//////                            currentAmount = 0.0
//////                        }
////                    
////                    RotateGesture()
////                        .onChanged {value in
////                            currentAngleAmount = value.rotation
////                        }
////                        .onEnded {value in
////                            finalAngleAmount += currentAngleAmount
////                            currentAngleAmount = .zero
////                        }
////                        
////                )
//            
//            Text("For double gestures, use two different ones")
//                .onTapGesture {
//                    print("tap on text")
//                }
//        }
//        .simultaneousGesture(TapGesture().onEnded {
//            print("tap on background")
//        })
    }
} 

#Preview {
    ContentView()
}
