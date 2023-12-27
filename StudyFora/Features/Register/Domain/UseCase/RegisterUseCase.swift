//
//  RegisterUseCase.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 26/12/23.
//

import Foundation
import Combine
import FirebaseAuth

struct RegisterUseCase {
    var repository: RegisterRepository
    
    func execute(data: RegisterRequestModel) async throws -> AuthDataResult? {
        return try await withCheckedThrowingContinuation { continuation in
            repository.doRegister(data:data) { result in
                do {
                    let authResult = try result.get()
                    print("User registered successfully!")
                    continuation.resume(returning: authResult)
                } catch {
                    print("Error registering user: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
