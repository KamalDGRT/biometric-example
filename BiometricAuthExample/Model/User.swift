//
//  User.swift
//  BiometricAuthExample
//

import Foundation

struct User: Codable {
    let id: String
    var name: String
    var email: String
    var password: String
    var isBiometricEnabled: Bool
}

struct Users: Codable {
    var users: [User]
}
