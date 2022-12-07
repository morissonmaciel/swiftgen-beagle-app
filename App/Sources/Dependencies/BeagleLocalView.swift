//
//  BeagleLocalView.swift
//  BeagleApp
//
//  Created by Morisson Marcel on 06/12/22.
//

import Beagle
import SwiftUI

@available(iOS 13, *)
struct BeagleWrappedView: UIViewRepresentable {
    var contents: String
    
    func makeUIView(context: Self.Context) -> UIView {
        BeagleView(contents) { _ in }
    }
    
    func updateUIView(_ uiView: UIView, context: Self.Context) {
        //
    }
}

@available(iOS 13, *)
func BeagleLocalView(contents: String) -> some View {
    BeagleWrappedView(contents: contents)
        .fixedSize()
}
