//
//  RegisterView.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/12/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var router: Router
    
    @EnvironmentObject var registerViewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            Text("Register")
            TextField("Email", text: $registerViewModel.email)
                .modifier(TextFieldModifier())
            TextField("Password", text: $registerViewModel.password)
                .modifier(TextFieldModifier())
            Button("Register") {
                Task {
                    await registerViewModel.register()
                    router.navigateBack()
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

