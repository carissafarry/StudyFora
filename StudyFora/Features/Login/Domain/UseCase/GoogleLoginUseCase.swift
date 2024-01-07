//
//  GoogleLoginUseCase.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

struct GoogleLoginUseCase {
    var repository: LoginRepository
    
    func execute() async throws -> AuthCredential? {
        guard
            let clientID = FirebaseApp.app()?.options.clientID,
            let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = await windowScene.windows.first?.rootViewController
//            let rootViewController = await UIApplication.shared.windows.first?.rootViewController
        else {
            throw ErrorMessageEnum.errorMessage(message: "No view controller available")
        }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        return try await withCheckedThrowingContinuation { continuation in
            repository.signIn(config: config, presentedUI: rootViewController) { credential in
                do {
                    let credential = try credential.get()
                    print("User logined with Google successfully!")
                    continuation.resume(returning: credential)
                } catch {
                    print("Error login user with Google: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
