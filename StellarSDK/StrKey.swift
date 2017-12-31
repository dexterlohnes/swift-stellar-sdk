//
//  StrKey.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation
import CryptoSwift
import SwiftBase32


typealias byte = UInt8

class StrKey {
    
    /// Decode decodes the provided StrKey into a raw value, checking the checksum
    /// and ensuring the expected VersionByte (the version parameter) is the value
    /// actually encoded into the provided src string.
    static func decode(versionByte: VersionByte, encoded: [Character]) throws -> [byte] {
        guard encoded.count <= 128 else {
            throw DecodeError.LengthGreaterThan128
        }
        
        guard let decoded: [byte] = base32Decode(String(encoded)) else {
            throw DecodeError.Base32DecodeError
        }
        
        let decodedVersionByte = decoded[0]
        
        guard decodedVersionByte == versionByte.Base32() else {
            throw DecodeError.VersionByteInvalid
        }
        let payload: [byte]  = Array(decoded[0 ..< decoded.count - 2])
        let data: [byte]     = Array(payload[1 ..< payload.count])
        let checksum: [byte] = Array(decoded[decoded.count - 2 ..< decoded.count])
        
        let expectedChecksum = calculateChecksum(bytes: payload)
        
        guard expectedChecksum == checksum else {
            throw DecodeError.ChecksumInvalid
        }
        
        // TODO: I discovered that if I make decoded, payload, and data vars such that we can actually
        // empty their data before moving on for security's sake, our unit tests don't pass if we do so
        // and presumably our encoding and decoding is broken. As such, we should find a way
        // to have everthing work and still clear this data out before exiting the function
        
//         Java SDK only does this if the version byte is of type SEED, but I figure we may as well just do it anyway.
//         I believe this is done as a security measure to prevent SEED being stored in memory anywhere while unencrypted.
//        decoded.removeAll()
//        payload.removeAll()
//        data.removeAll()
        
        return data
    }
    
    static func decode(versionByte: VersionByte, data: String) throws -> [byte] {
        do {
            return try decode(versionByte: versionByte, encoded: data.toChars())
        } catch let e as DecodeError {
            throw e
        }
    }
    
    // Encode encodes the provided data to a StrKey, using the provided version
    // byte.
    static func encode(versionByte: VersionByte, data: [byte]) -> [Character] {
        var payload = [versionByte.Base32()] + data
        var checksum = calculateChecksum(bytes: payload)
        var unencoded = payload + checksum
        var encodedBytes = base32Encode(unencoded)
        let encodedChars = encodedBytes.toChars()
        
        // For security, we do this to ensure that this data isn't lying around in memory
        payload.removeAll()
        checksum.removeAll()
        unencoded.removeAll()
        encodedBytes.removeAll()
        
        return encodedChars
    }
    
    static func calculateChecksum(bytes: [byte]) -> [byte] {
        var crc: UInt16 = 0x0000
        var count = bytes.count
        var i = 0
        var code: UInt16
        
        while (count > 0) {
            code = crc >> 8 & 0xFF
            code ^= UInt16(bytes[i]) & 0xFF
            code ^= code >> 4
            crc = crc << 8 & 0xFFFF
            crc ^= code
            code = code << 5 & 0xFFFF
            crc ^= code
            code = code << 7 & 0xFFFF
            crc ^= code
            i += 1
            count -= 1
        }
        
        return crc.toBytes()
    }
}

