//
//  UserModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation
import FirebaseAuth

struct UserModel: Codable, Hashable {
    var uid: String
    var email: String
    var password: String? = ""
    var username: String? = ""
    var fullname: String? = ""
    var photoUrl: String? = ""
    var isEmailVerified: Bool? = false
}

extension UserModel {
    var avatarUrl: String {
        photoUrl ?? "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"
    }
        
    var isCurrentUser: Bool {
        Auth.auth().currentUser!.uid == uid
    }
}
