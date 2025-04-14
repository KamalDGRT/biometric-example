//
//  AppState.swift
//  BiometricAuthExample
//
// Reference: https://stackoverflow.com/a/61134245

import Foundation

final class AppState: ObservableObject {
    /*
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        lhs.isLoggedIn == rhs.isLoggedIn &&
        lhs.moveToLaunchScreen == rhs.moveToLaunchScreen &&
        lhs.user == rhs.user
    }
    */
    @Published var moveToLaunchScreen: Bool
    @Published var isLoggedIn: Bool
    @Published var user: User
    
    init() {
        self.moveToLaunchScreen = false
        self.isLoggedIn = false
        self.user = User(id: "", name: "", email: "", password: "")
    }
}

extension AppState {
    var userId: String {
        user.id
    }
    
    var userName: String {
        user.name
    }
    
    var userEmail: String {
        user.email
    }
    
    func resetLoggedInUser() {
        user = User(id: "", name: "", email: "", password: "")
    }
}
