//
//  KeyPair.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/28/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation
import Sodium

/*
 It's kinda silly, but this is mostly just a class wrapper around the Sign.KeyPair struct provided by Sodium
 I'd be all for someone implementing this more elegantly if possible.
 */
class KeyPair {
    
    private var wrappedKey : Sign.KeyPair?
    
    init() {}
    
    init(from secretSeed: Data?) {
        guard let _ = secretSeed as Data! else {
            return
        }
        wrappedKey = Sodium().sign.keyPair(seed: secretSeed!.prefix(upTo: Sodium().sign.SeedBytes))
    }
    
    public func canSign() -> Bool {
        return wrappedKey != nil && wrappedKey?.secretKey.isEmpty == false
    }
    
    public func sign(message: Data) -> Data? {
        guard canSign() else {
            return Data()
        }
        
        return Sodium().sign.sign(message: message, secretKey: wrappedKey!.secretKey)
    }
    
    public func signature(message: Data) -> Data? {
        guard canSign() else {
            return Data()
        }
        
        return Sodium().sign.signature(message: message, secretKey: wrappedKey!.secretKey)
    }
    
}
