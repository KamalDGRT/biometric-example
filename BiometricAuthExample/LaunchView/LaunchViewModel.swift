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
}
