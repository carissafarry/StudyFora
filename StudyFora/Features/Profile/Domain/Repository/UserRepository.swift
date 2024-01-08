//
//  UserRepository.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation

protocol UserRepository {
    func fetchUsers(completion: @escaping (Result<[UserModel], Error>) -> Void)
    func saveUser(user: UserModel) -> Bool
    func getUser(withUid uid: String,  completion: @escaping (Result<UserModel, Error>) -> Void)
}
