//
//  Color.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import SwiftUI

// MARK: - UIColor Color Extension

extension Color {
    /// Color extension
    ///
    /// How to use it:
    ///
    /// `Color.text.primary`
    static let text = TextColor()
    static let bg = BgColor()
}

struct TextColor {
//    let primary = Color(hex: "#4E7294")
    
    let primary = Color.primaryDark
    let green = Color.greenDark
    let red = Color.redDark
    let yellow = Color.yellowDark
    
//    let brown = Color(hex: "#734848")
//    let darkBlue = Color(hex: "#355E85")
}

struct BgColor {
    let blue = Color.primaryLight
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
}

