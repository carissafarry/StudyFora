//
//  LoginRepositoryImpl.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 06/01/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

struct LoginRepositoryImpl: LoginRepository {
    func login(withEmail data: RegisterRequestModel, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            } else {
                fatalError("Unexpected nil value in authResult")
            }
        }
    }
    
    func login(withCredential credential: AuthCredential, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            } else {
                fatalError("Unexpected nil value in authResult")
            }
        }
    }
    
    func signIn(config: GIDConfiguration, presentedUI: UIViewController, completion: @escaping (Result<AuthCredential, Error>) -> Void) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentedUI) { result, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                fatalError("Error loading user token")
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

            completion(.success(credential))
        }
    }
}
