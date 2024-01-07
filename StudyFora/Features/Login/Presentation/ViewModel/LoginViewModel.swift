//
//  LoginViewModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 06/01/24.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

class LoginViewModel: ObservableObject {
    private var loginRepository: LoginRepository
    private var emailLoginUseCase: EmailLoginUseCase
//    = EmailLoginUseCase(repository: loginRepository)
    private var googleLoginUseCase: GoogleLoginUseCase
    private var credentialLoginUseCase: CredentialLoginUseCase
//    = GoogleLoginUseCase(repository: loginRepository)
    
    @Published var states: StatesEnum = .initiate
    @Published var userLogin: LoginResponseModel?
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository // how to assign repository directly to viewmodel without usecase
        self.emailLoginUseCase = EmailLoginUseCase(repository: self.loginRepository)
        self.googleLoginUseCase = GoogleLoginUseCase(repository: self.loginRepository)
        self.credentialLoginUseCase = CredentialLoginUseCase(repository: self.loginRepository)
    }
    
    func emailLogin(data: RegisterRequestModel) async {
        do {
            states = .loading
            
            if let res = try await emailLoginUseCase.execute(data: data) {
                userLogin = LoginResponseModel(
                    uid: res.user.uid,
                    email: res.user.email!
                )
            }
            
            states = .success
        } catch _ {
            states = .error
        }
    }
    
    func googleLogin() async {
        do {
            states = .loading
            
            if let credential = try await googleLoginUseCase.execute() {
                if let res = try await credentialLoginUseCase.execute(credential: credential) {
                    userLogin = LoginResponseModel(
                        uid: res.user.uid,
                        email: res.user.email!
                    )
                }
            }
            
            states = .success
        } catch {
            states = .error
        }
    }
}
