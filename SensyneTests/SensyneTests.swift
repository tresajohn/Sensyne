//
//  SensyneTests.swift
//  SensyneTests
//
//  Created by Melwin Jose Kottayil on 1/21/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import XCTest
@testable import Sensyne

class SensyneTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDisplayDetails() {
        let jsonToBeTested = hospitalJSONList
        XCTAssert(jsonToBeTested.count != 0, "Hospital List is not empty")
    }
    
    func testCheckFileExist() {
        var paths = Service.shared.fetchDataFromFile()
        XCTAssert(paths != nil, "File is available")
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
}
