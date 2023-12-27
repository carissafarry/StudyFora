//
//  RegisterRepository.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 26/12/23.
//

import FirebaseAuth

protocol RegisterRepository{
    func doRegister(data: RegisterRequestModel, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
}
