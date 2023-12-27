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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                .navigationDestination(for: Router.Destination.self) { destination in
                    Routes(route: destination)
                }
            }
            .environmentObject(router)
            
        }
    }
}
