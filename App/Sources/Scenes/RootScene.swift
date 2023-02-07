//
//  RootScene.swift
//  Papered
//
//  Created by Morisson Marcel on 30/11/22.
//

import SwiftUI

struct RootScene: View {
    var body: some View {
        HStack {
            BeagleLocalView(
                contents: getContents(file: "BeagleSample"))
        }
    }
}

#if DEBUG

struct RootScene_Previews: PreviewProvider {
    static var previews: some View {
        BeagleConfig().config()
        return RootScene()
    }
}

#endif
