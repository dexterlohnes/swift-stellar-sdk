//
//  UInt16.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/30/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation


extension UInt16 {
    
    /// Converts the 16-bit int to an array-of-size-2 of bytes/UInt8s
    /// Note that the memory is interpreted right-to-left which means
    /// `0000101011110000` will become [`11110000`, `00001010`]
    /// and 0xAAFF will become [`0xFF`, `0xAA`]
    func toBytes() -> [byte] {
        var mutableCopy = self
        
        let bytes = withUnsafeBytes(of: &mutableCopy) {
            Array<byte>($0)
        }
        
        return bytes
    }
}
