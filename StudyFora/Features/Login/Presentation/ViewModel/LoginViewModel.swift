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
    static var shared = LoginViewModel(
        loginRepository: LoginRepositoryImpl(),
        userRepository: UserRepositoryImpl.shared
    )
    
    @Published var isLogined: Bool = false
    @Published var email = ""
    @Published var password = ""
    
    // MARK: - Repository
    private var loginRepository: LoginRepository
    private var userRepository: UserRepository
    
    // MARK: - UseCase
    private var emailLoginUseCase: EmailLoginUseCase
    private var googleLoginUseCase: GoogleLoginUseCase
    private var credentialLoginUseCase: CredentialLoginUseCase
    
    @Published var states: StatesEnum = .initiate
    
    init(loginRepository: LoginRepository, userRepository: UserRepository) {
        self.loginRepository = loginRepository // how to assign repository directly to viewmodel without usecase
        self.userRepository = userRepository // how to assign repository directly to viewmodel without usecase
        self.emailLoginUseCase = EmailLoginUseCase(repository: self.loginRepository)
        self.googleLoginUseCase = GoogleLoginUseCase(repository: self.loginRepository)
        self.credentialLoginUseCase = CredentialLoginUseCase(repository: self.loginRepository)
    }
    
    @MainActor
    func emailLogin() async {
        do {
            states = .loading
            let data = RegisterRequestModel(email: email, password: password)
            // MARK: Not using repository, but using AuthService
            if let res = try await emailLoginUseCase.executeWithService(data: data) {
                isLogined = true
                states = .success
            }
        } catch _ {
            states = .error
        }
    }
    
    @MainActor
    func googleLogin() async {
        do {
            states = .loading
            
            // MARK: Using repository
            if let credential = try await googleLoginUseCase.execute() {
                if let res = try await credentialLoginUseCase.execute(credential: credential) {
                    AuthService.shared.userSession = res.user
                    isLogined = true
                    states = .success
                }
            }
        } catch {
            states = .error
        }
    }
}
