//
//  EnableBiometricViewModel.swift
//  BiometricAuthExample
//

final class EnableBiometricViewModel {
    func didTapEnableBiometric(by userID: String) {
        do {
            try KeychainUserDefaults.shared.setBiometricPreference(
                for: userID,
                isEnabled: true
            )
        } catch {
            print("Failed to Enable Biometrics")
            print(error.localizedDescription)
        }
    }
    
    func didTapMaybeLater(by userID: String) {
        do {
            try KeychainUserDefaults.shared.setBiometricPreference(
                for: userID,
                isEnabled: false
            )
        } catch {
            print("Failed to Update Biometric Preference")
            print(error.localizedDescription)
        }
    }
}
