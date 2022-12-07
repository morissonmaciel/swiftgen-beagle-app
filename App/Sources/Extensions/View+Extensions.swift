//
//  View+Extensions.swift
//  BeagleApp
//
//  Created by Morisson Marcel on 06/12/22.
//

import SwiftUI
import Foundation

extension View {
    func getContents(file: String, withExtension: String = "json") -> String {
        guard let jsonURL = Bundle.main.url(forResource: file, withExtension: withExtension),
              let jsonData = try? Data(contentsOf: jsonURL),
              let jsonContents = String(data: jsonData, encoding: .utf8) else {
            return String()
        }
        
        return jsonContents
    }
}
