//
//  SomethingToMock.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/27/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation

class Account: TransactionBuilderAccount{
    
    private let keypair : KeyPair
    private var sequenceNumber : Int
    
    init(pair: KeyPair, seqNum: Int ) {
        keypair = pair
        sequenceNumber = seqNum
    }
    
    func getKeypair() -> KeyPair {
        return KeyPair()
    }
    
    func getSequenceNumber() -> Int {
        return sequenceNumber
    }
    
    func getIncrementedSequenceNumber() -> Int {
        return sequenceNumber + 1
    }
    
    func incrementSequenceNumber(){
        sequenceNumber += 1
    }
    
}
