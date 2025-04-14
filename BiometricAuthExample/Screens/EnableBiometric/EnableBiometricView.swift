//
//  EnableBiometricView.swift
//  BiometricAuthExample
//

import SwiftUI

struct EnableBiometricView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    
    private var viewModel = EnableBiometricViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            contentView
            Spacer()
        }
        .background(Color.black.opacity(0.8))
        .navigationBarBackButtonHidden()
    }
}

extension EnableBiometricView {
    var titleView: some View {
        HStack {
            Spacer()
            Text("Enable Biometric Login?")
                .fontWeight(.black)
                .foregroundStyle(.white)
            Spacer()
        }
    }
    
    var contentView: some View {
        VStack(spacing: .zero) {
           titleView
            
            Image(.faceID)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding(.top, 40)
            
            Text("Enable biometric for your next Log In to the app?")
                .fontWeight(.medium)
                .foregroundStyle(.cyan)
                .padding(.top, 32)
                .padding(.horizontal, 48)
                .multilineTextAlignment(.center)
            
            NormalButton(
                title: "Enable",
                backgroundColor: .red,
                foregroundColor: .white,
                cornerRadius: 10
            ) {
                viewModel.didTapEnableBiometric(by: appState.userId)
            }
            .padding(.top, 50)
            .padding(.horizontal, 64)
            
            Button {
                viewModel.didTapMaybeLater(by: appState.userId)
                dismiss()
            } label: {
                Text("Maybe next time")
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
            }
            .padding(.top, 32)
        }
    }
}

#Preview {
    NavigationStack {
        let appState = AppState()
        appState.user = User(
            id: "randomID",
            name: "John Doe",
            email: "john@gmail.com",
            password: "samplePassword"
        )
        return EnableBiometricView()
            .environmentObject(appState)
    }
}
