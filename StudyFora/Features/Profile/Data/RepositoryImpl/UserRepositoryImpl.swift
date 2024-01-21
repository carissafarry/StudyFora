//
//  UserRepositoryImpl.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation
import Firebase

// MARK: NOT USED -------

// Make UserRepositoryImpl as Class so the data can be shared over multiple ViewModel

class UserRepositoryImpl: UserRepository, ObservableObject {
    static var shared = UserRepositoryImpl()
    
    @Published var user: UserModel? {
        didSet {
            print("new value set!")
            print(user!)
        }
    }
    
    init() {
        print("UserRepositoryImpl initialized!")
    }
    
    func fetchUsers(completion: @escaping (Result<[UserModel], Error>) -> Void) {
//        Firestore.firestore().collection("users")
//            .getDocuments { snapshot, _ in
//                guard let documents = snapshot?.documents else { return }
//                let users = documents.compactMap({ try? $0.data(as: UserModel.self)})
//                
//                completion(users)
//            }
    }
    
    func saveUser(user: UserModel) -> Bool {
        self.user = user
        return true
    }
    
    func getUser(withUid uid: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
//        Firestore.firestore().collection("users")
//            .document(uid)
//            .getDocument { snapshot, _ in
//                guard let snapshot = snapshot else { return }
//                var user: User
//                
//                do {
//                    user = try snapshot.data(as: UserModel.self)
//                } catch {
//                    print ("Error fetchUser: \(error)")
//                    return
//                }
//                
//                completion(user)
//            }
    }
}
