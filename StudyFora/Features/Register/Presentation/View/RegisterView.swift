//
//  RegisterView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/12/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var router: Router
    
    @StateObject var registerViewModel = RegisterViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Register")
            TextField("Email", text: self.$email)
            TextField("Password", text: self.$password)
            Button("Register") {
                Task {
                    await registerViewModel.register(data: RegisterRequestModel(email: email, password: password))
                    print(email)
                }
            }
            Button("Back") {
                router.navigateBack()
            }
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}

