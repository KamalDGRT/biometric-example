//
//  BiometricPreference.swift
//  BiometricAuthExample
//

struct BiometricPreference: Codable {
    var userID: String
    var isBiometricEnabled: Bool = false
    var biometricPromptCount: Int = 0
}
