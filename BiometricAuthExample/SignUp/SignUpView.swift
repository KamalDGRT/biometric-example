//
//  SignUpView.swift
//  BiometricAuthExample
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ScrollView {
            Text("Hi, This is Sign Up View")
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
