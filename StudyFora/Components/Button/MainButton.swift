//
//  MainButton.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import Foundation
import SwiftUI

struct MainButton: ButtonStyle {
    enum MainButtonType {
        case success
        case warning
        case danger
    }

    var width: CGFloat?
    var height: CGFloat?
    var buttonColor = Color.redDark
    var cornerRadius: CGFloat = 8
    var type = MainButtonType.success
    var fontSize = UIDevice.isIPad ? CGFloat(20) : CGFloat(16)
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(type == .success ? .text.green : type == .warning ? .text.yellow : .text.red)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .shadow(radius: 2, y: 3)
    }
}

struct MainButtonView: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(MainButton(width: 180))
    }
}

#Preview {
    MainButtonView()
}
