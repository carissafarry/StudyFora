//
//  StudyForaApp.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 24/10/23.
//

import SwiftUI

@main
struct StudyForaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var router = Router()
    
    // MARK: - States
    @State private var contentViewModel = ContentViewModel.shared
    @State private var registerViewModel = RegisterViewModel.shared
    
    // MARK: - State Objects
    @StateObject private var loginViewModel = LoginViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .rootModifier()
                
                .navigationDestination(for: Router.Destination.self) { destination in
                    Routes(route: destination)
                        .rootModifier()
                }
            }
            .environment(\.contentViewModel, contentViewModel)
            .environmentObject(registerViewModel)
            .environmentObject(loginViewModel)
            .environmentObject(router)
            
        }
    }
}
