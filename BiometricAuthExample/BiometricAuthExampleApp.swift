//
//  BiometricAuthExampleApp.swift
//  BiometricAuthExample
//

import SwiftUI

@main
struct BiometricAuthExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppState())
        }
    }
}
