//
//  LaunchScreen.swift
//  BiometricAuthExample
//

import SwiftUI

enum LaunchNavigation: String, CaseIterable, Hashable {
    case signUp
    case logIn
    case none
}

struct LaunchScreen: View {
    @ObservedObject private var viewModel = LaunchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                NormalButton(
                    title: "Sign Up",
                    backgroundColor: Color.black,
                    foregroundColor: .white
                ) {
                    viewModel.showSignUpView()
                }
                
                NormalButton(
                    title: "Log In",
                    backgroundColor: Color.blue,
                    foregroundColor: .white
                ) {
                    viewModel.showLoginView()
                }
                
                NormalButton(
                    title: "Sign In With Biometrics",
                    backgroundColor: Color.red,
                    foregroundColor: .white
                ) {
                    viewModel.showLoginView()
                }
            }
            .padding(.horizontal, 64)
            .navigationTitle("Biometric App Example")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(
                isPresented: $viewModel.shouldNavigate
            ) {
                switch viewModel.currentView {
                case .logIn:
                    LogInView()
                case .signUp:
                    SignUpView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
