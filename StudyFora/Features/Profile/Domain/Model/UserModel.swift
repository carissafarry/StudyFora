//
//  UserModel.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation
import FirebaseAuth

struct UserModel {
    let uid: String
    let email: String
    let password: String? = ""
    let username: String? = ""
    let photoUrl: String? = ""
    let isEmailVerified: Bool? = false
}

extension UserModel {
    var avatarUrl: String {
        photoUrl ?? "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"
    }
        
    var isCurrentUser: Bool {
        Auth.auth().currentUser!.uid == uid
    }
}
