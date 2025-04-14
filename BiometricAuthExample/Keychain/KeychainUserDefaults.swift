//
//  KeychainUserDefaults.swift
//  BiometricAuthExample
//

import KeychainVault

enum LoginError: Error {
    case emailAlreadyExists
    case userNotFound
    case invalidCredentials
}

final class KeychainUserDefaults {
    private let keychain = KeychainHandler(serviceName: "com.example.BiometricAuth")
    
    static let shared = KeychainUserDefaults()
    
    private init() { }
    
    func addUser(_ user: User) throws {
        
        var users = fetchUsers()
        if !users.contains(where: { $0.email == user.email }) {
            users.append(user)
            try keychain.set(
                object: Users(users: users),
                category: "com.example.BiometricAuth",
                key: "users"
            )
            print("Added successfully!")
        } else {
            throw LoginError.emailAlreadyExists
        }
        
        if users.isEmpty {
            try keychain.set(
                object: Users(users: [user]),
                category: "com.example.BiometricAuth",
                key: "users"
            )
            print("Added successfully!")
        }
    }
    
    func fetchUsers() -> [User] {
        do {
            let users: Users = try keychain.getObject(for: "com.example.BiometricAuth", with: "users")
            return users.users
        } catch {
            return []
        }
    }
}
