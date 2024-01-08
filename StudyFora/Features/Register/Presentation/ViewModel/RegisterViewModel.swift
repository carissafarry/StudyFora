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
    @Published var userLogin: UserModel?
    
    init() {
        print("RegisterViewModel initialized!")
    }
    
    func register(data: RegisterRequestModel) async {
        do {
            states = .loading
            
            if let res = try await registerUseCase.execute(data: data) {
                userLogin = UserModel(
                    uid: res.user.uid,
                    email: res.user.email!
                )
            }
            states = .success
        } catch _ {
            states = .error
        }
    }
}
