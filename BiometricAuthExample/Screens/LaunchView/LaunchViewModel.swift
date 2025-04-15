//
//  LaunchViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class LaunchViewModel: ObservableObject {
    @Published var shouldNavigate: Bool = false
    @Published var currentView: LaunchNavigation  = .none
    
    func showSignUpView() {
        currentView = .signUp
        shouldNavigate = true
    }
    
    func showLoginView() {
        currentView = .logIn
        shouldNavigate = true
    }
    
    func navigateToHome() {
        currentView = .home
        shouldNavigate = true
    }
    
    var shouldShowBiometricAuthCTA: Bool {
        KeychainUserDefaults.shared.isBiometricEnrolled()
    }
    
    func validateBiometricAuth(onSuccess: ((User) -> Void)?) {
        do {
            let userData = try KeychainUserDefaults.shared.getBiometricUserData()
            onSuccess?(userData)
        } catch {
            print("User not found")
        }
    }
}
