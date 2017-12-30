//
//  UInt16ExtensionTests.swift
//  StellarSDKTests
//
//  Created by Dexter Lohnes on 12/30/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import XCTest
import Cuckoo
@testable import StellarSDK

class UInt16ExtensionTests: XCTestCase {
    
    func test_ConversionReturnsExpectedOutput() {
        let test: UInt16 = 0xAAFF
        let expectedOutcome: [byte] = [0xAA, 0xFF]
        XCTAssertEqual(test.toBytes(), expectedOutcome)
    }
    
}
