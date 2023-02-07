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
        let sut = RootScene()
        let view = try? sut.inspect().view(BeagleApp.BeagleWrappedView.self).actualView()
        let vc = UIHostingController(rootView: view)

        let expectation = expectation(description: "Async beagle view load")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            let error = verifySnapshot(matching: vc, as: .image(on: .iPhone8), snapshotDirectory: self.snapshotDirectory)
            XCTAssertNil(error)
        }
    }
}
