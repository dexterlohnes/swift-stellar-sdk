//
//  StrKeyTests.swift
//  StellarSDKTests
//
//  Created by Dexter Lohnes on 12/30/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import XCTest
import Cuckoo
import Sodium

@testable import StellarSDK

class StrKeyTests: XCTestCase {
    
    typealias byte = UInt8
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_AfterEncodingThenDecodingSeed_ResultIsIdenticalToOriginalInput() throws {
        let seed = "SDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCRHBE"
        let secret: [byte] = try StrKey.decode(versionByte: VersionByte.SEED, data: seed)
        let encoded = StrKey.encode(versionByte: VersionByte.SEED, data: secret)
        let encodedString = String(encoded)
        XCTAssertEqual(seed, encodedString)
    }
}
