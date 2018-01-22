//
//  KeyPairTests.swift
//  StellarSDKTests
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import XCTest
import Cuckoo
import Sodium

@testable import StellarSDK

class KeyPairTests: XCTestCase {
    
    private let SEED = "1123740522f11bfef6b3671f51e159ccf589ccf8965262dd5f97d1721d383dd4"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_WhenSigningData_CorrectSignatureIsCreated() {
        let expectedSignature = "587d4b472eeef7d07aafcd0b049640b0bb3f39784118c2e2b73a04fa2f64c9c538b4b2d0f5335e968a480021fdc23e98c0ddf424cb15d8131df8cb6c4bb58309".toHexData()!
        let keypair = KeyPair(fromSecretSeed: SEED.toHexData())
        let inputData = "hello world".toData()
        let signature: Data = keypair.signature(message: inputData)!
        XCTAssertEqual(signature.toHex(), expectedSignature.toHex())
    }
    
    func test_VerificationOfSignatureIsTrue_WhenDerivedFromSeed() {
        let signature = "587d4b472eeef7d07aafcd0b049640b0bb3f39784118c2e2b73a04fa2f64c9c538b4b2d0f5335e968a480021fdc23e98c0ddf424cb15d8131df8cb6c4bb58309".toHexData()!
        let keypair = KeyPair(fromSecretSeed: SEED.toHexData())
        let inputData = "hello world".toData()
        XCTAssertTrue(keypair.verify(data: inputData, signature: signature))
    }
    
    func test_VerificationOfSignatureIsFalse_WhenDerivedFromDifferentSeed() {
        let badSignature = "687d4b472eeef7d07aafcd0b049640b0bb3f39784118c2e2b73a04fa2f64c9c538b4b2d0f5335e968a480021fdc23e98c0ddf424cb15d8131df8cb6c4bb58309".toHexData()!
        let corrupt = Data()
        let keypair = KeyPair(fromSecretSeed: SEED.toHexData())
        let inputData = "hello world".toData()
        XCTAssertFalse(keypair.verify(data: inputData, signature: badSignature))
        XCTAssertFalse(keypair.verify(data: inputData, signature: corrupt))
        
        
    }
}
