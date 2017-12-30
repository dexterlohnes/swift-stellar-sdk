//
//  Sign_KeyPair.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation
import Sodium

extension Sign.KeyPair {
    init() {
        publicKey = Sign.PublicKey()
        secretKey = Sign.SecretKey()
    }
}
