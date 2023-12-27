//
//  RegisterRepositoryImpl.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 26/12/23.
//

import Foundation
import FirebaseAuth

struct RegisterRepositoryImpl: RegisterRepository {
    func doRegister(data: RegisterRequestModel, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            } else {
                fatalError("Unexpected nil value in authResult")
            }
        }
    }
}
