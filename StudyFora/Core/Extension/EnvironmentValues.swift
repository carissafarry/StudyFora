//
//  EnvironmentValues.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 27/12/23.
//

import Foundation
import SwiftUI

// MARK: - Environment Values

extension EnvironmentValues {
    var customFont: Font {
        get { self[CustomFontKey.self] }
        set { self[CustomFontKey.self] = newValue }
    }
    
    // MARK: - View Model
    
    var registerViewModel: RegisterViewModel {
        get { self[RegisterViewModelKey.self] }
        set { self[RegisterViewModelKey.self] = newValue }
    }
    
    var loginViewModel: LoginViewModel {
        get { self[LoginViewModelKey.self] }
        set { self[LoginViewModelKey.self] = newValue }
    }
}


// MARK: - System Variable Environment Keys

struct CustomFontKey: EnvironmentKey {
    static let defaultValue: Font = .system(.body)
}


// MARK: - View Model Environment Keys

struct RegisterViewModelKey: EnvironmentKey {
    static let defaultValue: RegisterViewModel = .init()
}

struct LoginViewModelKey: EnvironmentKey {
    static let defaultValue: LoginViewModel = .init(loginRepository: LoginRepositoryImpl())
}
