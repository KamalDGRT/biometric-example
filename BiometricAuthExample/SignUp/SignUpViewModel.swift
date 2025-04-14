//
//  SignUpViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() -> User {
        User(
            id: .newUUIDString,
            name: userName,
            email: email,
            password: password,
            isBiometricEnabled: false
        )
    }
}
