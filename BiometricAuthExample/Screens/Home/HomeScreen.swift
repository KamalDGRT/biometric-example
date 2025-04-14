//
//  HomeScreen.swift
//  BiometricAuthExample
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @State var isBiometricEnabled: Bool = false
    
    var body: some View {
        NavigationStack {
            contentView
                .onAppear {
                    viewModel.decideEnableBiometric(for: appState.user.id)
                }
                .navigationTitle("Home View")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $viewModel.shouldShowEnrollBiometric) {
                    EnableBiometricView()
                }
        }
    }
}

extension HomeScreen {
    var contentView: some View {
        List {
            Section {
                Text(appState.userName)
                Text(appState.userEmail)
                Toggle("LogIn with Biometrics", isOn: $isBiometricEnabled)
                Button {
                    appState.moveToLaunchScreen = true
                    appState.resetLoggedInUser()
                    dismiss()
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
    return HomeScreen()
        .environmentObject(appState)
}
