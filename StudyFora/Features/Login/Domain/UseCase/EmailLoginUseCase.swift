//
//  EmailLoginUseCase.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 06/01/24.
//

import Foundation
import Combine
import FirebaseAuth

struct EmailLoginUseCase {
    var repository: LoginRepository
    
    func execute(data: RegisterRequestModel) async throws -> AuthDataResult? {
        return try await withCheckedThrowingContinuation { continuation in
            repository.login(withEmail: data) { result in
                do {
                    let authResult = try result.get()
                    print("User logined with email successfully!")
                    continuation.resume(returning: authResult)
                } catch {
                    print("Error login user with email: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    // MARK: Execute firebase from service class directly without repository
    func executeWithService(data: RegisterRequestModel) async throws -> AuthDataResult? {
        if let result = try await AuthService.shared.login(
            withEmail: data.email,
            password: data.password
        ) {
            print("User logined with email successfully!")
            return result
        }
        return nil
    }
}
