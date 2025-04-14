//
//  HomeViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var shouldShowEnrollBiometric: Bool = false
    
    /// The Scenario:
    /// - The user logs in and hasn't enrolled before.
    /// - The user sees Enable Biometric View.
    /// - The user taps on Maybe Later in Enable Biometric View.
    /// - The user lands back on Home View.
    /// - The onAppear gets triggered.
    /// - We shouldn't show the Enable Biometric View again.
    /// It is for that reason we have this variable
    var isEnrolmentViewPresented: Bool = false
    
    func decideEnableBiometric(for userID: String) {
        
        if !isEnrolmentViewPresented {
            shouldShowEnrollBiometric = KeychainUserDefaults.shared.shouldShowBiometricPrompt(for: userID)
            isEnrolmentViewPresented = true
        }
    }
}
