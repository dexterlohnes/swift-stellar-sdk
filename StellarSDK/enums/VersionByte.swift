//
//  VersionByte.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

enum VersionByte : Character {
    case ACCOUNT_ID     = "G"
    case SEED           = "S"
    case PRE_AUTH_TX    = "T"
    case SHA256_HASH    = "X"
    
    func Base32() -> byte {
        switch self {
        case VersionByte.ACCOUNT_ID:
            return 6 << 3
        case VersionByte.SEED:
            return 18 << 3
        case VersionByte.PRE_AUTH_TX:
            return 19 << 3
        case VersionByte.SHA256_HASH:
            return 23 << 3
        }
    }
}

