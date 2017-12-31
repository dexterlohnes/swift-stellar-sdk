//
//  DecodeErrors.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/30/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

enum DecodeError : LocalizedError {
    case LengthGreaterThan128
    case Base32DecodeError
    case VersionByteInvalid
    case ChecksumInvalid
}

extension DecodeError {
    public var errorDescription: String? {
        switch self {
        case .LengthGreaterThan128:
            return "Length of the provided array was greater than 128"
        case .Base32DecodeError:
            return "The base32Decode function from SwiftCrypto didn't work. Probably occured in StrKey::decode(...)"
        case .VersionByteInvalid:
            return "Expected a different version byte than what was decoded"
        case .ChecksumInvalid:
            return "Decoded checksum did not match checksum calculated from payload"
        }
        
    }
}
