//
//  View+Extensions.swift
//  BasicApp
//
//  Created by Morisson Marcel Ferreira Maciel on 06/02/23.
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
