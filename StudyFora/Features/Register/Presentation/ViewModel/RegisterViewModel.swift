//
//  RegisterViewModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/12/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
    static var shared = RegisterViewModel()
    
    private var registerUseCase = RegisterUseCase(repository: RegisterRepositoryImpl())
    
    @Published var states: StatesEnum = .initiate
    @Published var email = ""
    @Published var password = ""
    
    init() {
        print("RegisterViewModel initialized!")
    }
    
    @MainActor
    func register() async {
        do {
            states = .loading
            let data = RegisterRequestModel(email: email, password: password)
            
            // MARK: Not using repository, but using UserService
            _ = try await registerUseCase.executeWithService(data: data)
            states = .success
        } catch _ {
            states = .error
        }
    }
}
