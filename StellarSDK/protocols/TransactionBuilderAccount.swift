//
//  TransactionBuilderAccount.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/28/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

protocol TransactionBuilderAccount {
    
    /**
     * Returns keypair associated with this Account
     */
    func getKeypair() -> KeyPair
    
    /**
     * Returns current sequence number ot this Account.
     */
    func getSequenceNumber() -> Int
    
    /**
     * Returns sequence number incremented by one, but does not increment internal counter.
     */
    func getIncrementedSequenceNumber() -> Int
    
    /**
     * Increments sequence number in this object by one.
     */
    func incrementSequenceNumber()
}
