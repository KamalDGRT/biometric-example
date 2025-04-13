//
//  LogInView.swift
//  BiometricAuthExample
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ScrollView {
            Text("Hi, This is login View")
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
