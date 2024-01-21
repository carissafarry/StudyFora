//
//  UserService.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 21/01/24.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: UserModel?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: UserModel.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [UserModel] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: UserModel.self) })
        return users.filter({ $0.uid != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> UserModel {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: UserModel.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.photoUrl = imageUrl
    }
}
