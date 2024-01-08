//
//  ProfileViewModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    static var shared = ProfileViewModel(
        userRepository: UserRepositoryImpl.shared
    )
    
    // MARK: - Repository
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository // how to assign repository directly to viewmodel without usecase
    }
}
