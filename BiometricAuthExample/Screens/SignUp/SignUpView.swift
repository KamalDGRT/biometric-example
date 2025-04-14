//
//  SignUpView.swift
//  BiometricAuthExample
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Form {
            Section("Basic Information") {
                TextField("Name", text: $viewModel.userName)
                    .textInputAutocapitalization(.never)
                
                TextField("Email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .textInputAutocapitalization(.never)
                
                NormalButton(
                    title: "Sign Up",
                    backgroundColor: .black,
                    foregroundColor: .yellow
                ) {
                    viewModel.validateAndAddUser()
                }
            }
            
        }
        .navigationTitle("Sign Up View")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $viewModel.shouldShowAlert) {
            Alert(
                title: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK")) {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
