//
//  LogInView.swift
//  BiometricAuthExample
//

import SwiftUI

struct LogInView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        Form {
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            
            NormalButton(
                title: "Log In",
                backgroundColor: .black,
                foregroundColor: .yellow
            ) {
                
            }
        }
        .navigationTitle("Login View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        LogInView()
    }
}
