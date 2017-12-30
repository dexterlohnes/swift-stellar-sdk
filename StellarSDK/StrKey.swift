//
//  StrKey.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

typealias byte = UInt8

//static func encodeCheck(versionByte: VersionByte, data: Data) {
//
//}
class StrKey {
    
    static func decodeCheck(versionByte: VersionByte, data: [Character]) -> [byte] {
        return [byte]()
    }
    
    static func decodeCheck(versionByte: VersionByte, data: String) -> [byte] {
        return decodeCheck(versionByte: versionByte, data: data.toChars())
    }
    
    static func encodeCheck(versionByte: VersionByte, data: [byte]) -> [Character] {
        return [Character]()
    }
    
    static func calculateChecksum(bytes: [UInt16]) -> [UInt16]{
        // This code calculates CRC16-XModem checksum
        // Ported from https://github.com/alexgorbatchev/node-crc
        var crc : UInt16 = 0x0000
        var count = bytes.count
        var i = 0
        var code : UInt16
        
        while (count > 0) {
            code = crc >> 8 & 0xFF;
            i += 1
            code ^= bytes[i] & 0xFF;
            code ^= code >> 4;
            crc = crc << 8 & 0xFFFF;
            crc ^= code;
            code = code << 5 & 0xFFFF;
            crc ^= code;
            code = code << 7 & 0xFFFF;
            crc ^= code;
            count -= 1;
        }
        
        // little-endian
        return [crc, crc >> 8]
    }
}

