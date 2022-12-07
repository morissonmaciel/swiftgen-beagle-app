//
//  RootSceneTests.swift
//  iOSAppTests
//
//  Created by Morisson Marcel on 01/12/22.
//

@testable import BeagleApp
import SnapshotTesting
import ViewInspector
import XCTest
import SwiftUI
import UIKit

extension RootScene: Inspectable { }
extension BeagleApp.BeagleWrappedView: Inspectable { }

final class RootSceneTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        SnapshotTesting.isRecording = false
        BeagleApp.BeagleConfig().config()
    }
    
    var snapshotDirectory: String {
        return #filePath.replacingOccurrences(of: "Sources/RootSceneTests.swift", with: "ReferenceImages")
    }
    
    func testViewHierarchy() throws {
        let sut = RootScene()
        let value = try? sut.inspect().view(BeagleApp.BeagleWrappedView.self)
        XCTAssertNotNil(value)
    }
    
    func testRootSceneSnapshot() {
        let vc = UIHostingController(rootView: RootScene())
        let error = verifySnapshot(matching: vc, as: .image, snapshotDirectory: self.snapshotDirectory)
        XCTAssertNil(error)
    }
}
