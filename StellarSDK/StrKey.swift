//
//  StrKey.swift
//  StellarSDK
//
//  Created by Dexter Lohnes on 12/29/17.
//  Copyright © 2017 Dexter Lohnes. All rights reserved.
//

import Foundation
import CryptoSwift

typealias byte = UInt8

//static func encodeCheck(versionByte: VersionByte, data: Data) {
//
//}
class StrKey {
    
    // Decode decodes the provided StrKey into a raw value, checking the checksum
    // and ensuring the expected VersionByte (the version parameter) is the value
    // actually encoded into the provided src string.
    static func decode(versionByte: VersionByte, data: [Character]) -> [byte] {
        return [byte]()
    }
    
    static func decode(versionByte: VersionByte, data: String) -> [byte] {
        return decode(versionByte: versionByte, data: data.toChars())
    }
    
    // Encode encodes the provided data to a StrKey, using the provided version
    // byte.
    static func encode(versionByte: VersionByte, data: [byte]) -> [Character] {
        let payload = [versionByte.Base32()] + data
        let checksum = payload.crc16()
        return [Character]()
    }
    
    //    protected static char[] encodeCheck(VersionByte versionByte, byte[] data) {
    //    try {
    //    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    //    outputStream.write(versionByte.getValue());
    //    outputStream.write(data);
    //    // Calling ::toByteArray() here is non-destructive,
    //    // which means that our next call when we create 'unencoded[]'
    //    // includes all previous data written to the output stream
    //    byte payload[] = outputStream.toByteArray(); // Version byte + data
    //    byte checksum[] = StrKey.calculateChecksum(payload); // Checksum of versionbyte + data
    //    outputStream.write(checksum);
    //    byte unencoded[] = outputStream.toByteArray(); // Version byte + data + checksum of VB+D
    //    Base32 base32Codec = new Base32();
    //    byte[] bytesEncoded = base32Codec.encode(unencoded); // Encoded of VB+D+CS
    //
    //    char[] charsEncoded = new char[bytesEncoded.length];
    //    for (int i = 0; i < bytesEncoded.length; i++) {
    //    charsEncoded[i] = (char) bytesEncoded[i];
    //    }
    //
    //    // TODO: Please clarify this
    //    // My belief is that this is merely a precautionary measure to ensure
    //    // we clear all SEED related data from memory as a security measure. Is this the case?
    //    // dlohnes - December 30, 2017
    //    if (VersionByte.SEED == versionByte) {
    //    Arrays.fill(unencoded, (byte) 0);
    //    Arrays.fill(payload, (byte) 0);
    //    Arrays.fill(bytesEncoded, (byte) 0);
    //    }
    //    return charsEncoded;
    //    } catch (IOException e) {
    //    throw new AssertionError(e);
    //    }
    //    }
    
//    static func calculateChecksum(bytes: [UInt16]) -> [UInt16]{
//        // This code calculates CRC16-XModem checksum
//        // Ported from https://github.com/alexgorbatchev/node-crc
//        var crc : UInt16 = 0x0000
//        var count = bytes.count
//        var i = 0
//        var code : UInt16
//
//        while (count > 0) {
//            code = crc >> 8 & 0xFF;
//            i += 1
//            code ^= bytes[i] & 0xFF;
//            code ^= code >> 4;
//            crc = crc << 8 & 0xFFFF;
//            crc ^= code;
//            code = code << 5 & 0xFFFF;
//            crc ^= code;
//            code = code << 7 & 0xFFFF;
//            crc ^= code;
//            count -= 1;
//        }
//
//        // little-endian
//        return [crc, crc >> 8]
//    }
    
}

