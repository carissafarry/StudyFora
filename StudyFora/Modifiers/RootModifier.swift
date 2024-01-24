//
//  RootModifier.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 23/01/24.
//

import SwiftUI

struct RootModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func rootModifier() -> some View {
        modifier(RootModifier())
    }
}
