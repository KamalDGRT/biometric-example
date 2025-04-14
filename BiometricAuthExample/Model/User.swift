//
//  User.swift
//  BiometricAuthExample
//

import Foundation

struct User: Codable, Equatable {
    let id: String
    var name: String
    var email: String
    var password: String
}

struct Users: Codable, Equatable {
    var users: [User]
}
