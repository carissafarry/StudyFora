//
//  Router.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 26/12/23.
//

import SwiftUI

struct Routes: View {
    let route: Router.Destination

    var body: some View {
        switch route {
        case .register:
            RegisterView()
        case .login:
            LoginView()
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        }
    }
}

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case register
        case login
        case home
        case profile
    }

    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
