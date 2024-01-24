//
//  Screen.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 08/01/24.
//

import Foundation
import SwiftUI

struct Screen {
    static var width: Double {
        UIScreen.main.bounds.size.width
    }

    static var height: Double {
        UIScreen.main.bounds.size.height
    }

    static var size: CGSize {
        UIScreen.main.bounds.size
    }

    static var orientation: UIInterfaceOrientation? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
        return windowScene.interfaceOrientation
    }
}
