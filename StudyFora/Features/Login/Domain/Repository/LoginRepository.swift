//
//  LoginRepository.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 06/01/24.
//

import FirebaseAuth
import GoogleSignIn

protocol LoginRepository{
    func login(withEmail data: RegisterRequestModel, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func login(withCredential credential: AuthCredential, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func signIn(config: GIDConfiguration, presentedUI: UIViewController, completion: @escaping (Result<AuthCredential, Error>) -> Void)
}
