//
//  UInt16.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/30/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

extension UInt16 {
    func toBytes() -> [byte] {
        var mutableCopy = self
        let bytes = withUnsafeBytes(of: &mutableCopy) {
            Array($0)
        }
        // I don't know why, but the above closure will return [0xFF, 0xAA] if you compute 0xAAFF.toBytes()
        // without the following reversal. Just something to do with how Swift interprets memory order I suppose
        // when converting to an array. Thus, we reverse on the following line
        return bytes.reversed()
    }
}
