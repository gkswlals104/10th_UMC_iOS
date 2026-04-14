//
//  MegaboxApp.swift
//  Megabox
//
//  Created by 이준성 on 3/16/26.
//

import SwiftUI

@main
struct MegaboxApp: App {
    @State private var showSplash = true
    
    @State var loginViewModel: LoginViewModel = LoginViewModel() //미리 준비 시킴
    @State var authManager: AuthManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                } else {
                    if authManager.isLoggedIn {
                        MainTabView()
                    } else {
                        LoginView()
                    }
                }
            }
            .environment(loginViewModel)
            .environment(authManager)
            .preferredColorScheme(.light)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    showSplash = false
                }
            }
        }
    }
}
