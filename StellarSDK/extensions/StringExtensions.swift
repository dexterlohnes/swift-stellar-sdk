//
//  StringExtensions.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation


extension String {
    
    /// Create `Data` from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a `Data` object. Note, if the string has any spaces or non-hex characters (e.g. starts with '<' and with a '>'), those are ignored and only hex characters are processed.
    ///
    /// - returns: Data represented by this hexadecimal string.
    
    func toHexData() -> Data? {
        var data = Data(capacity: characters.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else { return nil }
        
        return data
    }
    
    
    func toData() -> Data {
        guard let theData = self.data(using: String.Encoding.ascii) else {
            return Data()
        }
        return theData
    }
}


