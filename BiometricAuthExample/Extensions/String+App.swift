//
//  String+App.swift
//  BiometricAuthExample
//

import Foundation
import CryptoKit

extension String {
    static var newUUIDString: String {
        return UUID().uuidString
    }
    
    var hashedString: String {
        // converting string to data
        guard let inputData = self.data(using: .utf8)
        else { return "" }
        // insert to hash function
        let hashedData = SHA256.hash(data: inputData)
        let hashedString = hashedData.compactMap {
            // what the format means: % indicates start of format specifier
            // 0 specifies that the output should padded with zeros instead of spaces
            // 2 specifies that minimum width of output. if less than 2 characters it will be padded with zeros to ensure at least two characters
            // x specifies that interget should be formatted as hexadecimal number using lowercase letters a-f
            String(format: "%02x", $0 )
        }.joined()
        
        // print return hashed string
        return hashedString
    }
}
