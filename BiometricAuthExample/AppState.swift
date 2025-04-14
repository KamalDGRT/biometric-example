//
//  AppState.swift
//  BiometricAuthExample
//

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
    
    init(
        moveToLaunchScreen: Bool = false,
        isLoggedIn: Bool = false
    ) {
        self.moveToLaunchScreen = moveToLaunchScreen
        self.isLoggedIn = isLoggedIn
        self.user = User(id: "", name: "", email: "", password: "")
    }
}

extension AppState {
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
