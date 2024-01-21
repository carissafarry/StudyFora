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
    
    init() {
        print("RegisterViewModel initialized!")
    }
    
    @MainActor
    func register(data: RegisterRequestModel) async {
        do {
            states = .loading
            
            // MARK: Not using repository, but using UserService
            let res = try await registerUseCase.executeWithService(data: data)
            states = .success
        } catch _ {
            states = .error
        }
    }
}
