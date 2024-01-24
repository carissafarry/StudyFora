//
//  ContentView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    @State private var isActive = true
    
//    @Environment(\.contentViewModel) private var contentViewModel
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        if isActive {
            if (loginViewModel.isLogined) {
                HomeView()
            } else {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
    
                    Button("**Register Page**") {
                        router.navigate(to: .register)
                    }
                    .padding(.top, 12)
    
                    Button("**Login Page**") {
                        router.navigate(to: .login)
                    }
                    .padding(.top, 12)
                    
                    Button("**Home Page**") {
                        router.navigate(to: .home)
                    }
                    .padding(.top, 12)
                }
                .padding()
            }
        } 
//        else {
//            SplashScreen(isActive: $isActive)
//        }
    }
}

//#Preview {
//    ContentView()
//}
