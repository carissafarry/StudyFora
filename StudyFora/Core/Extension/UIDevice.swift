//
//  UIDevice.swift
//  StudyFora
//
//  Created by Carissa Farry Hilmi Az Zahra on 07/01/24.
//

import SwiftUI

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
