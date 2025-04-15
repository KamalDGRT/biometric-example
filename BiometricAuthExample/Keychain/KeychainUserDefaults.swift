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
}

// MARK: User Details
extension KeychainUserDefaults {
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
            let users: Users = try keychain.getObject(
                for: "com.example.BiometricAuth",
                with: "users"
            )
            return users.users
        } catch {
            return []
        }
    }
}

// MARK: Biometric Preferences
extension KeychainUserDefaults {
    func setBiometricPreference(
        for userID: String,
        isEnabled: Bool
    ) throws {
        // 1. if saved and the currently logged in user matches, we increment the count.
        // 2. If saved biometric preferences, but currently logged in user is different,
        //    we just update the existing key instead of deletion & updation.
        // 3. If the current user != saved preference, then it is a fresh login.
        // so, we can set the prompt count to 1 by default if the user is not enrolling.
        
        let currentPreference = getLocalBiometricPreference()
        var promptCount = 0
        
        if let saved = currentPreference {
            // If the user matches, get their previous prompt count
            if saved.userID == userID {
                promptCount = saved.biometricPromptCount
            }
        }
        
        if !isEnabled {
            promptCount += 1
        }
        
        try setBiometricData(
            userID: userID,
            promptCount: promptCount,
            isEnrolled: isEnabled
        )
    }
    
    private func setBiometricData(
        userID: String,
        promptCount: Int,
        isEnrolled: Bool
    ) throws {
        guard !userID.isEmpty else { return }
        try keychain.set(
            object: BiometricPreference(
                userID: userID,
                isBiometricEnabled: isEnrolled,
                biometricPromptCount: promptCount
            ),
            category: "com.example.BiometricAuth",
            key: "biometricPreference"
        )
    }
    
    func getLocalBiometricPreference() -> BiometricPreference? {
        do {
            return try keychain.getObject(
                for: "com.example.BiometricAuth",
                with: "biometricPreference"
            )
        } catch {
            return nil
        }
    }
    
    func clearBiometricPreference() throws {
        guard let _ = getLocalBiometricPreference() else { return }
        try keychain.delete(
            category: "com.example.BiometricAuth",
            keyName: "biometricPreference"
        )
    }
    
    func shouldShowBiometricPrompt(for userID: String) -> Bool {
        guard let preference = getLocalBiometricPreference() else { return true }
        
        guard preference.userID == userID else { return true }
        
        return !preference.isBiometricEnabled && preference.biometricPromptCount < 2
    }
    
    func isBiometricEnrolled(for userID: String) -> Bool {
        guard let preference = getLocalBiometricPreference() else { return false }
        
        guard preference.userID == userID else { return false }
        
        return preference.isBiometricEnabled
    }
    
    func isBiometricEnrolled() -> Bool {
        guard let preference = getLocalBiometricPreference() else { return false }
        return preference.isBiometricEnabled
    }
    
    func getBiometricUserData() throws -> User {
        let users = fetchUsers()
        
        guard let preference = getLocalBiometricPreference(),
                !users.isEmpty
        else { throw LoginError.userNotFound }
        
        guard let userData = users.first(where: { $0.id == preference.userID })
        else { throw LoginError.userNotFound }
        
        return userData
    }
}
