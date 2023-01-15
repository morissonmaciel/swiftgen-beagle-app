//
//  RootScene.swift
//  Papered
//
//  Created by Morisson Marcel on 30/11/22.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct RootScene: View {
    @State var rotationAngle = 0.0
    @State var color = Color.primary
    
    var body: some View {
        VStack {
            Image(systemName: "timelapse")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .rotationEffect(.degrees(rotationAngle))
            
            Text("Basic iOS App with SwiftGen")
                .padding()
        }.onAppear {
            withAnimation(.linear(duration: 1)
                .speed(0.1).repeatForever(autoreverses: false)) {
                    rotationAngle = 360.0
                }
            
            withAnimation(.easeIn(duration: 1)
                .speed(0.1).repeatForever(autoreverses: true)) {
                    color = Color.random()
                }
        }
    }
}

#if DEBUG

struct RootScene_Previews: PreviewProvider {
    static var previews: some View {
        RootScene()
    }
}

#endif
