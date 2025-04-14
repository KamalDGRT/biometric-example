//
//  LoginViewModel.swift
//  BiometricAuthExample
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
