//
//  LoginView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 06/01/24.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Login")
            TextField("Email", text: $loginViewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())
            SecureField("Password", text: $loginViewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())
            Button(action: {
                Task {
                    await loginViewModel.emailLogin()
                    print(loginViewModel.email)
                }
            }) {
                Text("Log in")
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal), action: {
                Task {
                    await loginViewModel.googleLogin()
                    print(loginViewModel.email)
                }
            })
            
            Button("Back") {
                router.navigateBack()
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
