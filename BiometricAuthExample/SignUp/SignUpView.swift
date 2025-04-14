//
//  SignUpView.swift
//  BiometricAuthExample
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        
        Form {
            Section("Basic Information") {
                TextField("Name", text: $viewModel.userName)
                TextField("Email", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
                
                NormalButton(
                    title: "Sign Up",
                    backgroundColor: .black,
                    foregroundColor: .yellow
                ) {
                    
                }
            }
            
        }
        .navigationTitle("Sign Up View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
