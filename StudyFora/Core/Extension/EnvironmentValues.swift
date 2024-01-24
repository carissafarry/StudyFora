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
    
    var contentViewModel: ContentViewModel {
        get { self[ContentViewModelKey.self] }
        set { self[ContentViewModelKey.self] = newValue }
    }
}


// MARK: - System Variable Environment Keys

struct CustomFontKey: EnvironmentKey {
    static let defaultValue: Font = .system(.body)
}


// MARK: - View Model Environment Keys

struct ContentViewModelKey: EnvironmentKey {
    static let defaultValue: ContentViewModel = .init()
}
