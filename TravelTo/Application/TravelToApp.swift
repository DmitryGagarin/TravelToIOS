//
//  TravelToApp.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

import SwiftUI

@main
struct TravelToApp: App {
    @StateObject private var env = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            if env.isLoggedIn {
                MainTabView()
                    .environmentObject(env)
            } else {
                SignInView(viewModel: env.makeSignInViewModel())
                    .environmentObject(env)
            }
        }
    }
}
