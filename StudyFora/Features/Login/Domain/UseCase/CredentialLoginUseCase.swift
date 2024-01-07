//
//  CredentialLoginUseCase.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import Foundation
import Combine
import FirebaseAuth

struct CredentialLoginUseCase {
    var repository: LoginRepository
    
    func execute(credential: AuthCredential) async throws -> AuthDataResult? {
        return try await withCheckedThrowingContinuation { continuation in
            repository.login(withCredential: credential) { result in
                do {
                    let authResult = try result.get()
                    print("User logined with credential successfully!")
                    continuation.resume(returning: authResult)
                } catch {
                    print("Error login user with credential: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
