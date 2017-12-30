//
//  DataExtensions.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

extension Data {
    
    /// Create hexadecimal string representation of `Data` object.
    ///
    /// - returns: `String` representation of this `Data` object.
    
    func toHex() -> String {
        return map { String(format: "%02x", $0) }
            .joined(separator: "")
    }
    
    func toString() -> String {
        let str = String.init(data: self, encoding: String.Encoding.ascii)
        guard let _ = str, str?.isEmpty == false else {
            return ""
        }
        return str!
    }
}
