//
//  ContentViewModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 22/01/24.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    static var shared = ContentViewModel()
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
//        setupSubscribers()
    }
    
    private func setupSubscribers() {
        // Subscribe to userSession changes. Set new value each time userSession from AuthService get a new value
        print("dari sini")
        AuthService.shared.$userSession.sink {[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
