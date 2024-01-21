//
//  AuthService.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 21/01/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws -> AuthDataResult? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            
            return result
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            return nil
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String) async throws -> AuthDataResult? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, uid: result.user.uid)
            
            return result
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            return nil
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates routing
        UserService.shared.reset() // sets current user object to nil
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        uid: String
    ) async throws {
        let user = UserModel(uid: uid, email: email)
//        let user = UserModel(uid: uid, email: email, fullname: fullname, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(uid).setData(userData)
        UserService.shared.currentUser = user
    }
}
