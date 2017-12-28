//
//  StellarSDKTests.swift
//  StellarSDKTests
//
//  Created by Dexter Lohnes on 12/27/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import XCTest
import Cuckoo
@testable import StellarSDK

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_GetIncrementedSequenceNumber_DoesNotForcePermanentChange() {
        let anAccount = Account(pair: MockKeyPair(), seqNum: 100)
        XCTAssertEqual(anAccount.getSequenceNumber(), 100)
        XCTAssertEqual(anAccount.getIncrementedSequenceNumber(), 101)
        XCTAssertEqual(anAccount.getSequenceNumber(), 100)
    }
    
    func test_IncrementSequenceNumber_DoesForcePermanentChange() {
        let anAccount = Account(pair: MockKeyPair(), seqNum: 100)
        XCTAssertEqual(anAccount.getSequenceNumber(), 100)
        anAccount.incrementSequenceNumber()
        XCTAssertEqual(anAccount.getSequenceNumber(), 101)
    }
    
}
