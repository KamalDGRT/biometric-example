//
//  SignUpViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func createUser() -> User {
        User(
            id: .newUUIDString,
            name: userName,
            email: email,
            password: password.hashedString
        )
    }
    
    func validateAndAddUser() {
        do {
            let user = createUser()
            try KeychainUserDefaults.shared.addUser(user)
        } catch LoginError.emailAlreadyExists {
            showAlert(message: "You have already registered, please login!")
        } catch {
            showAlert(message: "Something Went Wrong!")
        }
    }
    
    func showAlert(message: String) {
        self.alertMessage = message
        self.shouldShowAlert = true
    }
}
