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
    
    /// Important to note that it is expected behavior that
    /// righthand bits are interpreted first. See comments on UInt16::toBytes()
    func test_ConversionReturnsOutputWithBitsInterpretedRightmostFirst() {
        let test: UInt16 = 0xAAFF
        let expectedOutcome: [byte] = [0xFF, 0xAA]
        XCTAssertEqual(test.toBytes(), expectedOutcome)
    }
    
}
