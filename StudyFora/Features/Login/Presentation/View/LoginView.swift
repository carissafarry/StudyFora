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
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("Login")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: {
                Task {
                    await loginViewModel.emailLogin(data: RegisterRequestModel(email: email, password: password))
                    print(email)
                }
            }) {
                Text("Log in")
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal), action: {
                Task {
                    await loginViewModel.googleLogin()
                    print(email)
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
