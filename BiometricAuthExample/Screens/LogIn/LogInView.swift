//
//  LogInView.swift
//  BiometricAuthExample
//

import SwiftUI

struct LogInView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $viewModel.password)
                .textInputAutocapitalization(.never)
            
            NormalButton(
                title: "Log In",
                backgroundColor: .black,
                foregroundColor: .yellow
            ) {
                guard let user = viewModel.login()
                else { return }
                appState.user = user
                viewModel.navigateToHomeScreen()
            }
        }
        .navigationTitle("Login View")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $viewModel.shouldNavigateToHome) {
            HomeScreen()
        }
        .onReceive(self.appState.$moveToLaunchScreen) { moveToLaunchScreen in
            if moveToLaunchScreen && !viewModel.isBiometricEnrolled {
                self.appState.moveToLaunchScreen = false
                dismiss()
            }
        }
    }
}

#Preview {
    NavigationView {
        LogInView()
    }
}
