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
    
    private var wrappedKey : Sign.KeyPair
    
    public var publicKey: Sign.PublicKey {
        get {
            return wrappedKey.publicKey
        }
    }
    
    public var secretKey: Sign.SecretKey {
        get {
            return wrappedKey.secretKey
        }
    }
    
    init() {
        wrappedKey = Sign.KeyPair()
    }
    
    init(fromSecretSeed secretSeed: Data?) {
        let newWrappedKey = Sodium().sign.keyPair(seed: secretSeed!.prefix(upTo: Sodium().sign.SeedBytes))
        guard let _ = secretSeed, newWrappedKey != nil else {
            wrappedKey = Sign.KeyPair()
            return
        }
        wrappedKey = newWrappedKey!
    }
    
    public func canSign() -> Bool {
        return wrappedKey.secretKey.isEmpty == false
    }
    
    public func sign(message: Data) -> Data? {
        guard canSign() else {
            return Data()
        }
        
        return Sodium().sign.sign(message: message, secretKey: wrappedKey.secretKey)
    }
    
    public func signature(message: Data) -> Data? {
        guard canSign() else {
            return Data()
        }
        return Sodium().sign.signature(message: message, secretKey: wrappedKey.secretKey)
    }
    
    public func verify(data: Data, signature: Data) -> Bool {
        return Sodium().sign.verify(message: data, publicKey: wrappedKey.publicKey, signature: signature)
    }
    
}
