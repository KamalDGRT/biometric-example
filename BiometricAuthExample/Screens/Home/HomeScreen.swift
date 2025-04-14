//
//  HomeScreen.swift
//  BiometricAuthExample
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    
    @State var isBiometricEnabled: Bool = false
    
    var body: some View {
        List {
            Section {
                Text(appState.userName)
                Text(appState.userEmail)
                Toggle("LogIn with Biometrics", isOn: $isBiometricEnabled)
                Button {
                    appState.resetLoggedInUser()
                    dismiss()
                    appState.moveToLaunchScreen = true
                } label: {
                    Text("Sign out")
                }
            } header: {
                Text("Profile")
            }
            
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("2.2.1")
                }
            } header: {
                Text("ABOUT")
            }
        }
        .navigationTitle("Home View")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let appState = AppState()
    appState.user = User(
        id: "randomID",
        name: "John Doe",
        email: "john@gmail.com",
        password: "samplePassword"
    )
    return NavigationView {
        HomeScreen()
            .environmentObject(appState)
    }
}
