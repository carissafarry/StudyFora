//
//  RegisterViewModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/12/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
    private var registerUseCase = RegisterUseCase(repository: RegisterRepositoryImpl())
    
    @Published var states: StatesEnum = .initiate
    @Published var userLogin: LoginResponseModel?
    
    func register(data: RegisterRequestModel) async {
        do {
            if let res = try await registerUseCase.execute(data: data) {
                userLogin = LoginResponseModel(
                    uid: res.user.uid,
                    email: res.user.email!
                )
            }
        } catch let error {
            states = .error
        }
    }
}
