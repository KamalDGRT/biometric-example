//
//  LoginViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var shouldNavigateToHome: Bool = false
    
    func login() -> User? {
        let users = KeychainUserDefaults.shared.fetchUsers()
        
        if users.isEmpty {
            print("No users found!")
            return nil
        }
        guard let loggedInUser = users.first(where: {
            $0.email == email &&
            $0.password == password.hashedString
        }) else {
            print("Login Failed!")
            return nil
        }
        
        return loggedInUser
    }
    
    func navigateToHomeScreen() {
        shouldNavigateToHome = true
    }
    
    var isBiometricEnrolled: Bool {
        KeychainUserDefaults.shared.isBiometricEnrolled()
    }
}
